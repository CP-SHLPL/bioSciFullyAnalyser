import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
	final FocusNode? focusNode;
		final bool obscureText;
		final Future<void> Function(String)? onSubmitted;

  const MyTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLength,
    this.controller,
		this.focusNode,
		this.obscureText = false,
		this.onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
					floatingLabelBehavior: FloatingLabelBehavior.auto,
					labelText: labelText,
					prefixIcon: prefixIcon,
					suffixIcon: suffixIcon,
					border: const OutlineInputBorder(),
				),
        maxLength: maxLength,
      	focusNode: focusNode,
				obscureText: obscureText,
				onFieldSubmitted: onSubmitted,
			);
  }
}