import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:javagem/utils/colors.dart';

class TextInput extends StatefulWidget {
  const TextInput(
      {required this.name,
      required this.label,
      required this.placeholder,
      required this.onChanged,
      required this.controller,
      this.hasError = false,
      this.error,
      this.validator,
      this.secureText = false,
      super.key});

  final String name;
  final String label;
  final String placeholder;
  final void Function(String?) onChanged;
  final TextEditingController controller;
  final bool hasError;
  final String? error;
  final dynamic validator;
  final bool secureText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.secureText,
      decoration: InputDecoration(
          labelText: null,
          label: null,
          hintText: widget.placeholder,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red))),
      onChanged: (value) => widget.onChanged(value),
    );
  }
}
