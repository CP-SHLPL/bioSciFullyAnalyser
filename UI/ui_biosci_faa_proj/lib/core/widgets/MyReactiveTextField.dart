import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui_biosci_faa_proj/core/widgets/my_tooltip.dart';

class MyReactiveTextField<T> extends StatelessWidget {
  final String _formControlName;
  final String _labelText;
  final String? _toolTipMessage;
  final bool _isEditable;
  final Icon? prefixIcon;
  final ControlValueAccessor<T, String>? valueAccessor;

  const MyReactiveTextField({
    super.key,
    required String formControlName,
    required String labelText,
    required isEditable,
    String? toolTipMessage,
    Icon? this.prefixIcon,
    this.valueAccessor,
  }) : _toolTipMessage = toolTipMessage,
       _labelText = labelText,
       _formControlName = formControlName,
       _isEditable = isEditable;

  // TextStyle get uniformStyle =>
  //     Theme.of(context).textTheme.bodyMedium ?? const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<T>(
      formControlName: _formControlName,
      style:
          Theme.of(context).textTheme.bodyMedium ??
          const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        label: MyTooltip(
          labelText: _labelText,
          tooltipMessage: _toolTipMessage,
        ),
        prefixIcon: prefixIcon,
      ),
      valueAccessor: valueAccessor,
      readOnly: _isEditable,
    );
  }
}
