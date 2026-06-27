import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/core/notifiers/navigation_provider.dart';

class MasterDetailLayout extends ConsumerStatefulWidget {
  final Widget master;
  final Widget? defaultDetail;

  const MasterDetailLayout({
    super.key,
    required this.master,
    this.defaultDetail,
  });

  @override
  ConsumerState<MasterDetailLayout> createState() => _MasterDetailLayoutState();
}

class _MasterDetailLayoutState extends ConsumerState<MasterDetailLayout> {
  bool _isMasterVisible = true;

  void _toggleMasterVisibility() {
    setState(() {
      _isMasterVisible = !_isMasterVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailView = ref.watch(detailViewProvider);

    return Stack(
      children: [
        Row(
          children: [
            // Master Pane (Flex 3)
            if (_isMasterVisible)
              Expanded(
                flex: 3,
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
                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                          border: Border(
                            bottom: BorderSide(color: Theme.of(context).dividerColor),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Navigation",
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
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
                        child: widget.master,
                      ),
                    ],
                  ),
                ),
              ),
            // Detail Pane (Flex 7)
            Expanded(
              flex: 7,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: detailView ??
                    widget.defaultDetail ??
                    const Center(child: Text('Select an item to see details')),
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
