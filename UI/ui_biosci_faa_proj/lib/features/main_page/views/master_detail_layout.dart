import 'package:flutter/material.dart';

/// Data class to define an item in the Master-Detail layout.
class MasterDetailItem {
  /// The title or primary content of the item in the master list.
  final Widget collapsed;

  /// The content shown when this item is expanded in the master list.
  final Widget? expanded;

  /// The content to display in the detail pane when this item is clicked.
  final Widget detail;

  MasterDetailItem({
    required this.collapsed,
    this.expanded,
    required this.detail,
  });
}

class MasterDetailLayout extends StatefulWidget {
  final List<MasterDetailItem> items;
  final Widget? emptyDetail;

  const MasterDetailLayout({super.key, required this.items, this.emptyDetail});

  @override
  State<MasterDetailLayout> createState() => _MasterDetailLayoutState();
}

class _MasterDetailLayoutState extends State<MasterDetailLayout> {
  int? _selectedIndex;
  int _expandedIndices = -1;
  double _masterWidth = 350.0;
  bool _isMasterVisible = true;
  final double _minMasterWidth = 200.0;
  final double _maxMasterWidth = 800.0;

  void _toggleExpanded(int index) {
    setState(() {
      if (_expandedIndices == index) {
        _expandedIndices = -1;
      }
      else {
        _expandedIndices = index;
      }
    });
  }

  void _selectItem(int index) {
    setState(() {
      if(_selectedIndex  == index) {
        _selectedIndex = null;
      }
      else {
        _selectedIndex = index;
      }
    });
  }

  void _toggleMasterVisibility() {
    setState(() {
      _isMasterVisible = !_isMasterVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            // Master Pane
            if (_isMasterVisible)
              SizedBox(
                width: _masterWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border(
                      right: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Header with close button
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Navigation",
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, size: 20),
                              onPressed: _toggleMasterVisibility,
                              tooltip: "Close Sidebar",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.items.length,
                          itemBuilder: (context, index) {
                            final item = widget.items[index];
                            final isExpanded = _expandedIndices == index;
                            final isSelected = _selectedIndex == index;

                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              elevation: isSelected ? 8 : 2,
                              color: isSelected
                                  ? Theme.of(context)
                                        .colorScheme
                                        .primaryContainer
                                        .withOpacity(0.5)
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: isSelected
                                    ? BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      )
                                    : BorderSide.none,
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () => _selectItem(index),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    tileColor: isSelected
                                        ? Theme.of(context).colorScheme.primary.withAlpha(150)
                                        : Colors.transparent,
                                    textColor: isSelected
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onPrimary//withAlpha(250)
                                        : Colors.black,
                                    title: item.collapsed,
                                    trailing: item.expanded != null
                                        ? IconButton(
                                            icon: Icon(
                                              isExpanded
                                                  ? Icons.expand_less
                                                  : Icons.expand_more,
                                            ),
                                            onPressed: () =>
                                                _toggleExpanded(index),
                                          )
                                        : null,
                                  ),
                                  if (isExpanded && item.expanded != null)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0,
                                        bottom: 16.0,
                                      ),
                                      child: item.expanded!,
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // Draggable Divider
            if (_isMasterVisible)
              MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _masterWidth += details.delta.dx;
                      if (_masterWidth < _minMasterWidth)
                        _masterWidth = _minMasterWidth;
                      if (_masterWidth > _maxMasterWidth)
                        _masterWidth = _maxMasterWidth;
                    });
                  },
                  child: Container(
                    width: 6,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        width: 1,
                        height: 40,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                ),
              ),
            // Detail Pane
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: _selectedIndex != null
                    ? widget.items[_selectedIndex!].detail
                    : widget.emptyDetail ??
                          const Center(
                            child: Text('Select an item to see details'),
                          ),
              ),
            ),
          ],
        ),
        // Restore Button
        if (!_isMasterVisible)
          Positioned(
            left: 16,
            top: 16,
            child: FloatingActionButton.small(
              onPressed: _toggleMasterVisibility,
              tooltip: "Open Sidebar",
              child: const Icon(Icons.menu),
            ),
          ),
      ],
    );
  }
}
