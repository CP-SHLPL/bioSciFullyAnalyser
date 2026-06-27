import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reagent_tray_notifier.dart';

class ReagentTrayLayout extends ConsumerWidget {
  const ReagentTrayLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reagents = ref.watch(reagentTrayProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(constraints.maxWidth, constraints.maxHeight);
        final center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);

        // Radii based on size
        final outerRadius = size * 0.45;
        final innerRadius = size * 0.35;
        final reagentSize = size * 0.06;

        // Split reagents: 0-31 outer, 32-63 inner
        final outerReagents = reagents.sublist(0, 32);
        final innerReagents = reagents.sublist(32, 64);

        return Stack(
          children: [
            // Center indicator or plate
            Positioned(
              left: center.dx - innerRadius * 0.8,
              top: center.dy - innerRadius * 0.8,
              child: Container(
                width: innerRadius * 1.6,
                height: innerRadius * 1.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).dividerColor.withOpacity(0.1),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: const Center(child: Text("REAGENT TRAY")),
              ),
            ),

            // Outer Ring
            ...List.generate(32, (index) {
              final angle = (2 * math.pi * index) / 32;
              final x = center.dx + outerRadius * math.cos(angle);
              final y = center.dy + outerRadius * math.sin(angle);
              final reagent = outerReagents[index];

              return _PositionedReagent(
                left: x - reagentSize / 2,
                top: y - reagentSize / 2,
                size: reagentSize,
                reagent: reagent,
              );
            }),

            // Inner Ring
            ...List.generate(32, (index) {
              final angle = (2 * math.pi * index) / 32;
              final x = center.dx + innerRadius * math.cos(angle);
              final y = center.dy + innerRadius * math.sin(angle);
              final reagent = innerReagents[index];

              return _PositionedReagent(
                left: x - reagentSize / 2,
                top: y - reagentSize / 2,
                size: reagentSize,
                reagent: reagent,
              );
            }),
          ],
        );
      },
    );
  }
}

class _PositionedReagent extends StatelessWidget {
  final double left;
  final double top;
  final double size;
  final Reagent reagent;

  const _PositionedReagent({
    required this.left,
    required this.top,
    required this.size,
    required this.reagent,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () => _showDetails(context),
        onSecondaryTapDown: (details) => _showContextMenu(context, details.globalPosition),
        child: Tooltip(
          message: "Position: ${reagent.position}\nName: ${reagent.name}",
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: reagent.isEmpty
                  ? Colors.grey.shade300
                  : Theme.of(context).colorScheme.primary,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
              boxShadow: [
                if (!reagent.isEmpty)
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
              ],
            ),
            child: Center(
              child: Text(
                "${reagent.position}",
                style: TextStyle(
                  fontSize: size * 0.4,
                  fontWeight: FontWeight.bold,
                  color: reagent.isEmpty ? Colors.black54 : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Reagent Bottle Details - Position ${reagent.position}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reagent Name: ${reagent.name}"),
            const Text("Status: Loaded"),
            const Text("Volume remaining: 45ml / 50ml"),
            const Text("Lot Number: LOT123456"),
            const Text("Expiry Date: 2025-12-31"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _showContextMenu(BuildContext context, Offset globalPosition) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        globalPosition.dx,
        globalPosition.dy,
        globalPosition.dx + 1,
        globalPosition.dy + 1,
      ),
      items: [
        const PopupMenuItem(value: "load", child: Text("Load Reagent")),
        const PopupMenuItem(value: "unload", child: Text("Unload")),
        const PopupMenuItem(value: "properties", child: Text("Properties")),
      ],
    ).then((value) {
      if (value != null) {
        debugPrint("Selected action: $value for reagent ${reagent.position}");
      }
    });
  }
}
