import 'package:flutter/material.dart';

// ignore: camel_case_types
class Text_Form_Field extends StatelessWidget {
  const Text_Form_Field({
    super.key,
    required this.textformController,
    required this.iconData,
    required this.label,
    required this.keyboardType1,
    this.maxLines,
  });

  final TextEditingController textformController;
  final Icon iconData;
  final String label;
  final TextInputType keyboardType1;
  final int? maxLines;

  String? validateTextField(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "Please enter this fill";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
          maxLines: maxLines,
          controller: textformController,
          validator: (value) => validateTextField(value, context),
          decoration: InputDecoration(
            prefixIcon: iconData,
            label: Text(label),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          keyboardType: keyboardType1),
    );
  }
}
