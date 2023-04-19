import 'package:chatapp/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailTextFormField(this.emailController, {super.key});

  String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.please_enter_email;
    }

    if (!value.isValidEmail()) {
      return AppLocalizations.of(context)!.email_is_invalid;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: emailController,
        validator: (value) => validateEmail(value, context),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          label: Text(AppLocalizations.of(context)!.email_label),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}