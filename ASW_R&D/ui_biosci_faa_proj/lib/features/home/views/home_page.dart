import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:toastification/toastification.dart';
import 'package:ui_biosci_faa_proj/core/widgets/my_toast.dart';
import 'package:ui_biosci_faa_proj/features/home/data/home_page_provider.dart';
import 'package:ui_biosci_faa_proj/features/home/views/_custom_edit_widget.dart';
import 'package:ui_biosci_faa_proj/generated/login/login.pb.dart';
import '../../../core/widgets/custom_table.dart';
import '../../user/providers/user_provider.dart';

typedef EditPopupBuilder = Widget Function(
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

  void _refreshRows() {
    final homePageService = ref.read(homePageProvider);
    homePageService.getDictionaryValues(DictionaryRequest()..dictionaryId = 1).then((response) {
      print('Refreshed ${response.items.length} values from gRPC service');
      List<PlutoRow> newRows = [];
      for (var item in response.items) {
        newRows.add(
          PlutoRow(
            cells: {
              'id': PlutoCell(value: item.id),
              'value': PlutoCell(value: item.value),
              'age': PlutoCell(value: DateTime.now().toString()), // Providing a valid string for date type
              'actions': PlutoCell(value: item.id), // Dummy value for the actions column
              'info': PlutoCell(value: item.id), // Dummy value for the info column
            },
          ),
        );
      }
      if (mounted) {
        setState(() {
          _rows.clear();
          _rows.addAll(newRows);
        });
      }
    }).catchError((error) { print('Error refreshing dictionary values: $error'); return null; });
  }
  @override
  void initState() {
    super.initState();

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
        type: PlutoColumnType.date(),
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


  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final userName = user?.firstName ?? 'User';
    final userRole = user?.roleString ?? 'Role';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Text('Welcome $userName with his role $userRole'),
          SizedBox(height: 20),
          Expanded(
            child: ReusableDataTable(
              columns: columns,
              rows: _rows,
              showFilter: true,
              onEditPressed: (dialogContext, row, statemanager){
                return CustomEditWidget(
                  initialName: row.cells['value']?.value?.toString() ?? '',
                  dictionaryValueId: row.cells['id']!.value as int,
                  
                  onCancel: () {
                    Navigator.of(dialogContext).pop(); // Just close the dialog
                  },
                  onSaveSuccess: () => {
                    _refreshRows(),
                    MyToast.show(
                      context: context, 
                      title: 'Value updated successfully',
                      // icon: Icon(Icons.check_circle, color: Colors.green),
                      type: ToastificationType.success,
                      customDuration: Duration(seconds: 1),
                    ),
                  }
                );
              },
              onInfoPressed: (dialogContext, row){
                return CustomEditWidget(
                  initialName: row.cells['value']?.value?.toString() ?? '',
                  dictionaryValueId: row.cells['id']!.value as int,
                  
                  onCancel: () {
                    Navigator.of(dialogContext).pop(); // Just close the dialog
                  },
                  onSaveSuccess: () => {
                    _refreshRows(),
                    MyToast.show(
                      context: context, 
                      title: 'Value updated successfully',
                      // icon: Icon(Icons.check_circle, color: Colors.green),
                      type: ToastificationType.success,
                      customDuration: Duration(seconds: 1),
                    ),
                  }
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
