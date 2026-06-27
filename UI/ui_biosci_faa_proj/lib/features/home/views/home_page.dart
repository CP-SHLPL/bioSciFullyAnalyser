import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:toastification/toastification.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/drop_down_notifier.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/navigation_provider.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/test_card_notifier.dart';
import 'package:ui_biosci_faa_proj/features/main_page/views/master_detail_layout.dart';
import 'package:ui_biosci_faa_proj/core/widgets/my_toast.dart';
import 'package:ui_biosci_faa_proj/features/reagent_tray/reagent_tray_layout.dart';
import 'package:ui_biosci_faa_proj/features/sample_tray/sample_tray_layout.dart';
import 'package:ui_biosci_faa_proj/features/test_list/views/test_list_detail.dart';
import 'package:ui_biosci_faa_proj/features/home/data/home_page_provider.dart';
import 'package:ui_biosci_faa_proj/features/home/views/_custom_edit_widget.dart';
import 'package:ui_biosci_faa_proj/features/test/views/edit_test.dart';
import 'package:ui_biosci_faa_proj/generated/login/login.pb.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pb.dart';
import '../../../core/widgets/custom_table.dart';
import '../../user/providers/user_provider.dart';

typedef EditPopupBuilder = Widget Function(
  BuildContext context,
  PlutoRow row,
  PlutoGridStateManager stateManager,
);

class _MasterNavItem extends StatefulWidget {
  final Widget title;
  final VoidCallback onSelect;
  final Widget? expandedContent;
  final bool isSelected;

  const _MasterNavItem({
    required this.title,
    required this.onSelect,
    this.expandedContent,
    this.isSelected = false,
  });

  @override
  State<_MasterNavItem> createState() => _MasterNavItemState();
}

class _MasterNavItemState extends State<_MasterNavItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: widget.isSelected ? 4 : 1,
      color: widget.isSelected
          ? theme.colorScheme.primaryContainer
          : theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: _isExpanded
            ? BorderSide(color: theme.colorScheme.primary.withAlpha(128), width: 2)
            : BorderSide.none,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: DefaultTextStyle.merge(
              style: TextStyle(
                fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
                color: widget.isSelected ? theme.colorScheme.onPrimaryContainer : null,
              ),
              child: widget.title,
            ),
            onTap: widget.onSelect,
            trailing: widget.expandedContent != null
                ? IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: widget.isSelected ? theme.colorScheme.onPrimaryContainer : null,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  )
                : null,
          ),
          if (_isExpanded && widget.expandedContent != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: widget.expandedContent!,
            ),
        ],
      ),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<PlutoRow> _rows = [];
  late final List<PlutoColumn> columns;
  late PlutoGridStateManager stateManager;
  bool isLoading = false;
  List<int> selectedTests = [];
  String? _selectedMenuId; // Tracks which menu is selected for detail view

  void _refreshRows() async {
    setState(() {
      isLoading = true;
    });

    final homePageService = ref.read(homePageProvider);
    homePageService
        .getDictionaryValues(DictionaryRequest()..dictionaryId = 1)
        .then((response) {
      List<PlutoRow> newRows = [];
      for (var item in response.items) {
        newRows.add(
          PlutoRow(
            cells: {
              'id': PlutoCell(value: item.id),
              'value': PlutoCell(value: item.value),
              'age': PlutoCell(value: item.createdAt),
              'actions': PlutoCell(value: item.id),
              'delete': PlutoCell(value: item.id),
            },
          ),
        );
      }
      if (mounted) {
        setState(() {
          _rows.clear();
          _rows.addAll(newRows);
          isLoading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      return null;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dropdownMemoryProvider.notifier).fetchOnce();
      ref.read(allTestProvider.notifier).fetchOnce();
    });

    columns = [
      PlutoColumn(
        title: 'ID',
        field: 'id',
        type: PlutoColumnType.text(),
        enableSorting: true,
      ),
      PlutoColumn(
        title: 'Value',
        field: 'value',
        type: PlutoColumnType.text(),
        enableSorting: true,
      ),
      PlutoColumn(
        title: 'Age',
        field: 'age',
        type: PlutoColumnType.text(),
        enableSorting: true,
      ),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshRows();
    });
  }

  Widget _buildDictionaryDetail(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ReusableDataTable(
      columns: columns,
      rows: _rows,
      showFilter: true,
      onEditPressed: (dialogContext, row, statemanager) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = MediaQuery.of(context).size.width;
              final dialogWidth = screenWidth * 0.8;
              const maxWidth = 1300.0;
              return SizedBox(
                width: dialogWidth > maxWidth ? maxWidth : dialogWidth,
                child: const EditParameter(1),
              );
            },
          ),
        );
      },
      onDeletePressed: (dialogContext, row, stateManager) {
        return CustomEditWidget(
          initialName: row.cells['value']?.value?.toString() ?? '',
          dictionaryValueId: row.cells['id']!.value as int,
          onCancel: () => Navigator.of(dialogContext).pop(),
          onSaveSuccess: () {
            _refreshRows();
            MyToast.show(
              context: context,
              title: 'Value updated successfully',
              type: ToastificationType.success,
              customDuration: const Duration(seconds: 1),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasterDetailLayout(
        master: ListView(
          children: [
            _MasterNavItem(
              title: const Text('Parameters'),
              isSelected: _selectedMenuId == 'parameters',
              onSelect: () {
                setState(() => _selectedMenuId = 'parameters');
                ref.read(detailViewProvider.notifier).setDetailView(
                      TestListDetailWidget(
                        isVisible: true,
                        rowSize: 2,
                        aspectRatio: 5,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 30,
                        selectedTestIDs: selectedTests,
                      ),
                    );
              },
              expandedContent: TestListDetailWidget(
                isMasterList: true,
                rowSize: 1,
                aspectRatio: 5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 30,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                selectedTestIDs: selectedTests,
              ),
            ),
            _MasterNavItem(
              title: const Text('Data Dictionary'),
              isSelected: _selectedMenuId == 'dictionary',
              onSelect: () {
                setState(() => _selectedMenuId = 'dictionary');
                ref
                    .read(detailViewProvider.notifier)
                    .setDetailView(_buildDictionaryDetail(context));
              },
            ),
            _MasterNavItem(
              title: const Text('Reagent Tray'),
              isSelected: _selectedMenuId == 'reagent_tray',
              onSelect: () {
                setState(() => _selectedMenuId = 'reagent_tray');
                ref
                    .read(detailViewProvider.notifier)
                    .setDetailView(const ReagentTrayLayout());
              },
            ),
            _MasterNavItem(
              title: const Text('Sample Tray'),
              isSelected: _selectedMenuId == 'sample_tray',
              onSelect: () {
                setState(() => _selectedMenuId = 'sample_tray');
                ref
                    .read(detailViewProvider.notifier)
                    .setDetailView(const SampleTrayLayout());
              },
            ),
          ],
        ),
        defaultDetail: const Center(
          child: Icon(Icons.biotech, size: 100, color: Colors.grey),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(selectedTests),
        child: const Icon(Icons.save),
      ),
    );
  }
}
