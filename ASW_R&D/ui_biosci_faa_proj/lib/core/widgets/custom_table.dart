import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

typedef EditPopupBuilder =
    Widget Function(
      BuildContext context,
      PlutoRow row,
      PlutoGridStateManager stateManager,
    );
typedef InfoPopupBuilder =
    Widget Function(
      BuildContext context,
      PlutoRow row,
    );

class ReusableDataTable extends StatefulWidget {
  final List<PlutoColumn> columns;
  final List<PlutoRow> rows;
  final bool showFilter;

  // Optional: If provided, an "Actions" column with an edit button is added.
  // If left null, the table renders as purely read-only without the extra column.
  final EditPopupBuilder? onEditPressed;
  final InfoPopupBuilder? onInfoPressed;

  const ReusableDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.onEditPressed,
    this.showFilter = false,
    this.onInfoPressed
  });

  @override
  State<ReusableDataTable> createState() => _ReusableDataTableState();
}

class _ReusableDataTableState extends State<ReusableDataTable> {
  late final List<PlutoColumn> _finalColumns;
  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();

    // Start with the columns passed from the parent page
    _finalColumns = List.from(widget.columns);

    // Smart Upgrade: Only add the "Actions" column if an edit action was provided
    if (widget.onEditPressed != null) {
      _finalColumns.add(
        PlutoColumn(
          title: 'Actions',
          field: 'actions', // The dummy field name
          type: PlutoColumnType.text(),
          readOnly: true,
          enableSorting: false,
          enableColumnDrag: false,
          enableFilterMenuItem: false,
          enableContextMenu: false,
          width: 80,
          renderer: (rendererContext) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black54, size: 20),
                  splashRadius: 20,
                  onPressed: () {
                    // Trigger the popup builder passed from the parent
                    showDialog(
                      context: context,
                      builder: (dialogContext) => widget.onEditPressed!(
                        dialogContext,
                        rendererContext.row,
                        stateManager,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      );
    }
    if(widget.onInfoPressed != null){
      _finalColumns.add(
        PlutoColumn(
          title: 'Info',
          field: 'info', // The dummy field name
          type: PlutoColumnType.number(),
          readOnly: true,
          enableSorting: false,
          enableColumnDrag: false,
          enableFilterMenuItem: false,
          enableContextMenu: false,
          width: 80,
          renderer: (rendererContext) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.info_outline_rounded, color: Colors.blue, size: 20),
                  splashRadius: 20,
                  onPressed: () {
                    // Trigger the popup builder passed from the parent
                    showDialog(
                      context: context,
                      builder: (dialogContext) => widget.onInfoPressed!(
                        dialogContext,
                        rendererContext.row,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // If there is no data, show a friendly message instead of an empty grid
    if (widget.rows.isEmpty) {
      return const Center(child: Text('No data available.'));
    }

    return PlutoGrid(
      columns: _finalColumns,
      rows: widget.rows,
      // You can set global grid configurations here so all your tables look the same
      configuration: const PlutoGridConfiguration(
        style: PlutoGridStyleConfig(
          enableColumnBorderVertical: true,
          enableColumnBorderHorizontal: true,
          enableCellBorderVertical: true,
          enableCellBorderHorizontal: true,
        ),
        columnSize: PlutoGridColumnSizeConfig(
          autoSizeMode:
              PlutoAutoSizeMode.scale, // Auto-scales columns to fit screen
        ),
      ),
      onLoaded: (PlutoGridOnLoadedEvent event) {
        // Save the state manager so the edit popup can trigger cell updates
        stateManager = event.stateManager;
        stateManager.setShowColumnFilter(widget.showFilter); // Show filter if enabled
      },
    );
  }
}
