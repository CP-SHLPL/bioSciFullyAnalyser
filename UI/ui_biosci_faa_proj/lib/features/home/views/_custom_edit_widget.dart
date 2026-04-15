import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_biosci_faa_proj/generated/login/login.pb.dart';
import '../data/home_page_provider.dart';

class CustomEditWidget extends ConsumerStatefulWidget {
  final String initialName;
  final int dictionaryValueId;
  final VoidCallback onCancel;
  final VoidCallback? onSaveSuccess;

  const CustomEditWidget({
    super.key,
    required this.initialName,
    required this.dictionaryValueId,
    required this.onCancel,
    this.onSaveSuccess,
  });

  @override
  ConsumerState<CustomEditWidget> createState() => _CustomEditWidgetState();
}

class _CustomEditWidgetState extends ConsumerState<CustomEditWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSave(String value) {
    final homePageService = ref.read(homePageProvider);
    final DictionaryItemRequest request = DictionaryItemRequest()
      ..dictionaryKeyId = 1 // Example key ID, replace with actual value
      ..dictionaryValueId = widget.dictionaryValueId
      ..valueDescription = value; // Set the new value from the text field

    homePageService.updateDictionaryValue(request).then(  (response) {
      print('Value updated successfully: ${response.value}');
      widget.onSaveSuccess?.call();
    }).catchError((error) { print('Failed to update value: $error'); return null; });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit User Profile'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'Full Name'),
      ),
      actions: [
        TextButton(
          onPressed: widget.onCancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => onSave(_controller.text),
          child: const Text('Save Changes'),
        ),
      ],
    );
  }
}