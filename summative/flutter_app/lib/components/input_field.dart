import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? Function(String?) validator;
  final TextEditingController controller;
  const InputField({
    super.key,
    required this.label,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        label: Text(label),
      ),
    );
  }
}
