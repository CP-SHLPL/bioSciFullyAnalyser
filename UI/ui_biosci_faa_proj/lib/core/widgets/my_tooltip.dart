import 'package:flutter/material.dart';

class MyTooltip extends StatelessWidget{

  final String? tooltipMessage;
  final String labelText;

  const MyTooltip({
    required  this.labelText,
    this.tooltipMessage
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(labelText),
        if (tooltipMessage != null) ...[
          const SizedBox(width: 8),
          Tooltip(
            message: tooltipMessage!,
            triggerMode: TooltipTriggerMode.tap,
            waitDuration: const Duration(seconds: 1),
            showDuration: const Duration(seconds: 3),
            preferBelow: false,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 4.0, horizontal: 20.0),
              child: Icon(
                Icons.help_outline,
                size: 20,
                // Dynamically change the icon color based on readOnly status!
                color: Colors.blue,
              ),
            ),
          ),
        ]
      ],
    );
  }
}