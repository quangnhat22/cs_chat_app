import 'package:chatapp/core/utils/formz/check_valid.dart';
import 'package:flutter/material.dart';

enum InputType { text, phoneNumber, multiline }

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    this.controller,
    required this.icon,
    required this.label,
    this.type = InputType.text,
    this.isReadOnly = false,
    this.onTap,
    this.typeCheck = TypeValueCheck.none,
  });

  final TextEditingController? controller;
  final Icon icon;
  final String label;
  final InputType type;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final TypeValueCheck typeCheck;

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
        controller: controller,
        minLines: 1,
        maxLines: null,
        validator: (value) =>
            AppCheckValid.checkValid(value, typeCheck, context),
        decoration: InputDecoration(
          prefixIcon: icon,
          label: Text(label),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        keyboardType: _checkType(),
        readOnly: isReadOnly,
        onTap: onTap,
      ),
    );
  }
}
