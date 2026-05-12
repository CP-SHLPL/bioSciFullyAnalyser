import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui_biosci_faa_proj/core/widgets/my_tooltip.dart';
import 'package:ui_biosci_faa_proj/generated/test/test.pb.dart';


class MyReactiveDropDown extends StatelessWidget{
  final String _formControlName;
  final String _labelText;
  final String? _toolTipMessage;
  final bool _isEditable;
  final List<DropDownListItem> _dropDownItems;
  final Icon? prefixIcon;
  final Map<String, String Function(Object)>? validationMessages;


  const MyReactiveDropDown({
    super.key,
    required String formControlName,
    required String labelText,
    required isEditable,
    required dropDownItems,
    String? toolTipMessage,
    this.prefixIcon,
    this.validationMessages
  }) : _toolTipMessage = toolTipMessage,
        _labelText = labelText,
        _formControlName = formControlName,
        _isEditable = isEditable,
        _dropDownItems = dropDownItems;

  // TextStyle get uniformStyle =>
  //     Theme.of(context).textTheme.bodyMedium ?? const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context){
    return IgnorePointer(
      ignoring: _isEditable,
      child: ReactiveDropdownField<int>(
        formControlName: _formControlName,
        style: Theme.of(context).textTheme.bodyMedium ?? const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          label: MyTooltip(labelText: _labelText, tooltipMessage: _toolTipMessage,),
          prefixIcon: prefixIcon
        ),
        items: _dropDownItems
            .map(
              (item) => DropdownMenuItem<int>(
            value: item.value,
            child: Text(item.text),
          ),
        )
            .toList(),
        validationMessages: validationMessages,
      ),
    );
  }

}