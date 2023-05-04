import 'package:flutter/material.dart';

enum InputType { text, phoneNumber, multiline }

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required this.icon,
    required this.label,
    this.type = InputType.text,
    this.errorText,
    this.initVal,
    this.onChanged,
    this.isReadOnly = false,
    this.onTap,
  });

  final Icon icon;
  final String label;
  final InputType type;
  final String? errorText;
  final String? initVal;
  final Function(String?)? onChanged;
  final VoidCallback? onTap;
  final bool isReadOnly;

  TextInputType _checkType() {
    switch (type) {
      case InputType.text:
        return TextInputType.text;
      case InputType.phoneNumber:
        return TextInputType.phone;
      case InputType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        minLines: 1,
        maxLines: null,
        initialValue: initVal,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: icon,
          label: Text(label),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        keyboardType: _checkType(),
        onChanged: onChanged,
        readOnly: isReadOnly,
        onTap: onTap,
      ),
    );
  }
}
