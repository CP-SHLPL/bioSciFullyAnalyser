import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:toastification/toastification.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/drop_down_notifier.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/test_card_notifier.dart';
import 'package:ui_biosci_faa_proj/features/main_page/views/master_detail_layout.dart';
import 'package:ui_biosci_faa_proj/core/widgets/my_toast.dart';
import 'package:ui_biosci_faa_proj/features/test_list/views/test_list_detail.dart';
import 'package:ui_biosci_faa_proj/features/home/data/home_page_provider.dart';
import 'package:ui_biosci_faa_proj/features/home/views/_custom_edit_widget.dart';
import 'package:ui_biosci_faa_proj/features/test/views/edit_test.dart';
import 'package:ui_biosci_faa_proj/features/test_list/views/test_list_master.dart';
import 'package:ui_biosci_faa_proj/generated/login/login.pb.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pb.dart';
import '../../../core/widgets/custom_table.dart';
import '../../user/providers/user_provider.dart';

typedef EditPopupBuilder =
    Widget Function(
      BuildContext context,
      PlutoRow row,
      PlutoGridStateManager stateManager,
    );

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<PlutoRow> _rows = [];
  late final List<PlutoColumn> columns;
  late PlutoGridStateManager stateManager;
  bool isLoading = false; // Add loading state
  // List<TestCardData> testCardData = [];
  List<int> selectedTests = [];

  void _refreshRows() async {
    setState(() {
      isLoading = true; // Set loading to true when fetching starts
    });

    // final testService = ref.read(testServiceProvider);
    // final testList = await testService.getTestList(TestListRequest()
    //   ..includeSpecialSolutions = true
    //   ..includeVisibleOnly = true);
    // testCardData.addAll(testList.tests);

    final homePageService = ref.read(homePageProvider);
    homePageService
        .getDictionaryValues(DictionaryRequest()..dictionaryId = 1)
        .then((response) {
          print('Refreshed ${response.items.length} values from gRPC service');
          List<PlutoRow> newRows = [];
          for (var item in response.items) {
            newRows.add(
              PlutoRow(
                cells: {
                  'id': PlutoCell(value: item.id),
                  'value': PlutoCell(value: item.value),
                  'age': PlutoCell(value: item.createdAt),
                  // Providing a valid string for date type
                  'actions': PlutoCell(value: item.id),
                  // Dummy value for the actions column
                  'delete': PlutoCell(value: item.id),
                  // Dummy value for the info column
                },
              ),
            );
          }
          if (mounted) {
            setState(() {
              _rows.clear();
              _rows.addAll(newRows);
              isLoading = false; // Set loading to false when fetching is done
            });
          }
        })
        .catchError((error) {
          print('Error refreshing dictionary values: $error');
          setState(() {
            isLoading = false; // Set loading to false on error
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
        enableSorting: true, // Enable sorting
      ),
      PlutoColumn(
        title: 'Value',
        field: 'value',
        type: PlutoColumnType.text(),
        enableSorting: true, // Enable sorting
      ),
      PlutoColumn(
        title: 'Age',
        field: 'age',
        type: PlutoColumnType.text(),
        enableSorting: true, // Enable sorting
      ),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshRows();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<MasterDetailItem> getMasterDetailItems(BuildContext context){
    return [
      MasterDetailItem(
        collapsed: const Text('Parameters'),
        expanded: TestListDetailWidget(
          isMasterList: true,
          rowSize: 2,
          aspectRatio: 5,
          mainAxisSpacing: 15,
          crossAxisSpacing: 30,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // onTap: (testID) {
          //   if (selectedTests.contains(testID)) {
          //     selectedTests.remove(testID);
          //   } else {
          //     selectedTests.add(testID);
          //   }
          //   setState(() {
          //     selectedTests = [...selectedTests];
          //   });
          //   print('Selected: $testID');
          // },
          selectedTestIDs: selectedTests,
        ),
        detail: Row(
          children: [
            Expanded(
              child: TestListDetailWidget(
                isVisible: true,
                rowSize: 2,
                aspectRatio: 5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 30,
                // onTap: (testID) {
                //   if (selectedTests.contains(testID)) {
                //     selectedTests.remove(testID);
                //   } else {
                //     selectedTests.add(testID);
                //   }
                //   setState(() {
                //     selectedTests = [...selectedTests];
                //   });
                //   print('Selected: $testID');
                // },
                selectedTestIDs: selectedTests,
              ),
            ),
          ],
        ),
      ),
      MasterDetailItem(
        collapsed: const Text('Data Dictionary'),
        detail: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ReusableDataTable(
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
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final userName = user?.firstName ?? 'User';
    final userRole = user?.roleString ?? 'Role';

    // Sample items for Master-Detail Layout
    final masterDetailItems = getMasterDetailItems(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MasterDetailLayout(
              items: masterDetailItems,
              emptyDetail: const Center(
                child: Icon(Icons.build_circle, size: 50),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(selectedTests),
        child: const Icon(Icons.save),
      ),
    );
  }
}
