import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A reusable widget that listens to a control's status.
/// If the control is marked as disabled in the logic, it hides the widget entirely.
class HideWhenDisabled extends StatelessWidget {
    final String formControlName;
    final Widget child;

    const HideWhenDisabled({
    super.key,
    required this.formControlName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveStatusListenableBuilder(
      formControlName: formControlName,
      builder: (context, control, child) {
        // If the control is disabled in the form group, don't render it
        if (control.disabled) {
          return const SizedBox.shrink(); 
        }
        return child!;
      },
      child: child, // Passes the child so it doesn't rebuild unnecessarily
    );
  }
}