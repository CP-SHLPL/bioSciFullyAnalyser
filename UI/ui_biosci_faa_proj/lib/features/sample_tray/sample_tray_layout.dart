import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sample_tray_notifier.dart';

class SampleTrayLayout extends ConsumerWidget {
  const SampleTrayLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final samples = ref.watch(sampleTrayProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(constraints.maxWidth, constraints.maxHeight);
        final center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);

        // Radii based on size
        final r1Radius = size * 0.44; // Outer (now starts numbering here)
        final r2Radius = size * 0.36; // Ring 2
        final r3Radius = size * 0.28; // Ring 3
        final r4Radius = size * 0.18; // Inner (ends numbering here)
        
        final sampleSize = size * 0.045;

        // Numbering starts from outermost ring (62-83 -> 0-21 in visual flow)
        // Split samples: 0-21 outer, 22-43 ring 2, 44-65 ring 3, 66-83 inner
        final ring1Samples = samples.sublist(0, 22);
        final ring2Samples = samples.sublist(22, 44);
        final ring3Samples = samples.sublist(44, 66);
        final ring4Samples = samples.sublist(66, 84);

        return Stack(
          children: [
            // Center indicator
            Positioned(
              left: center.dx - r4Radius * 0.7,
              top: center.dy - r4Radius * 0.7,
              child: Container(
                width: r4Radius * 1.4,
                height: r4Radius * 1.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).dividerColor.withOpacity(0.05),
                  border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.5)),
                ),
                child: const Center(child: Text("SAMPLE TRAY", style: TextStyle(fontSize: 10))),
              ),
            ),

            // Ring 1 (Outer - 22 samples)
            ..._buildRing(center, r1Radius, 22, ring1Samples, sampleSize, offset: math.pi / 22),

            // Ring 2 (22 samples)
            ..._buildRing(center, r2Radius, 22, ring2Samples, sampleSize, offset: 0),

            // Ring 3 (22 samples)
            ..._buildRing(center, r3Radius, 22, ring3Samples, sampleSize, offset: math.pi / 22),

            // Ring 4 (Inner - 18 samples)
            ..._buildRing(center, r4Radius, 18, ring4Samples, sampleSize, offset: 0),
          ],
        );
      },
    );
  }

  List<Widget> _buildRing(
    Offset center,
    double radius,
    int count,
    List<Sample> data,
    double size, {
    double offset = 0,
  }) {
    return List.generate(count, (index) {
      final angle = (2 * math.pi * index) / count + offset;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      final sample = data[index];

      return _PositionedSample(
        left: x - size / 2,
        top: y - size / 2,
        size: size,
        sample: sample,
      );
    });
  }
}

class _PositionedSample extends StatelessWidget {
  final double left;
  final double top;
  final double size;
  final Sample sample;

  const _PositionedSample({
    required this.left,
    required this.top,
    required this.size,
    required this.sample,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () => _showDetails(context),
        onSecondaryTapDown: (details) => _showContextMenu(context, details.globalPosition),
        child: Tooltip(
          message: "Position: ${sample.position}\nName: ${sample.name}",
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: sample.isEmpty
                  ? Colors.grey.shade200
                  : theme.colorScheme.secondary,
              border: Border.all(
                color: theme.colorScheme.outline.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                "${sample.position}",
                style: TextStyle(
                  fontSize: size * 0.35,
                  fontWeight: FontWeight.bold,
                  color: sample.isEmpty ? Colors.black45 : Colors.white,
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
        title: Text("Sample Details - Position ${sample.position}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sample ID: ${sample.name}"),
            const Text("Type: Serum"),
            const Text("Patient Name: John Doe"),
            const Divider(),
            const Text("Scheduled Tests:", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("- Glucose (GLU)"),
            const Text("- Cholesterol (CHOL)"),
            const Text("- Uric Acid (UA)"),
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
        const PopupMenuItem(value: "add", child: Text("Add Sample")),
        const PopupMenuItem(value: "assign", child: Text("Assign Tests")),
        const PopupMenuItem(value: "clear", child: Text("Clear Position")),
      ],
    ).then((value) {
      if (value != null) {
        debugPrint("Selected action: $value for sample ${sample.position}");
      }
    });
  }
}
