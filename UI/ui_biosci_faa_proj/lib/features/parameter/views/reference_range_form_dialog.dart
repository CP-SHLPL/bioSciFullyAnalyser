import 'package:flutter/material.dart';
import '../data/reference_range.dart';

// Popup dialog for entering a new reference range
class ReferenceRangeFormDialog extends StatefulWidget {
  const ReferenceRangeFormDialog({Key? key}) : super(key: key);

  @override
  State<ReferenceRangeFormDialog> createState() =>
      _ReferenceRangeFormDialogState();
}

class _ReferenceRangeFormDialogState extends State<ReferenceRangeFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';
  String ageStart = '';
  String ageEnd = '';
  String ageUnit = 'Years';
  String value = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Reference Range'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: gender,
              decoration: const InputDecoration(labelText: 'Gender'),
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (val) => setState(() => gender = val ?? 'Male'),
            ),
            DropdownButtonFormField<String>(
              value: ageUnit,
              decoration: const InputDecoration(labelText: 'Age Unit'),
              items: const [
                DropdownMenuItem(value: 'Days', child: Text('Days')),
                DropdownMenuItem(value: 'Months', child: Text('Months')),
                DropdownMenuItem(value: 'Years', child: Text('Years')),
              ],
              onChanged: (val) => setState(() => ageUnit = val ?? 'Years'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Age Start'),
              keyboardType: TextInputType.number,
              validator: (val) =>
                  val == null || val.isEmpty ? 'Required' : null,
              onSaved: (val) => ageStart = val ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Age End'),
              keyboardType: TextInputType.number,
              validator: (val) =>
                  val == null || val.isEmpty ? 'Required' : null,
              onSaved: (val) => ageEnd = val ?? '',
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Reference Range'),
              validator: (val) =>
                  val == null || val.isEmpty ? 'Required' : null,
              onSaved: (val) => value = val ?? '',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              Navigator.of(context).pop(
                ReferenceRange(
                  gender: gender,
                  ageStart: ageStart,
                  ageEnd: ageEnd,
                  ageUnit: ageUnit,
                  value: value,
                ),
              );
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}