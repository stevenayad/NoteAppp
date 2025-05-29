import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;

  final TextEditingController controller;
  final int? maxline;
  const CustomFormField({
    super.key,
    required this.label,
    this.maxline =1, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Enter you note";
        } else {
          return null;
        }
      },
      decoration: decoration(label),
    );
  }
}

InputDecoration decoration(String label) {
  return InputDecoration(
    label: Text(label),
    enabledBorder: outlineinputborder(Colors.blue),
    focusedBorder: outlineinputborder(),
  );
}

OutlineInputBorder outlineinputborder([Color? bordercolor]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: bordercolor ?? Colors.green),
  );
}
