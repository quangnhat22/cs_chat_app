import 'package:chatapp/common/widgets/stateless/form/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputOldPassword extends StatefulWidget {
  const InputOldPassword({super.key});

  @override
  State<InputOldPassword> createState() => _InputOldPasswordState();
}

class _InputOldPasswordState extends State<InputOldPassword> {
  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      icon: const Icon(Icons.lock),
      label: AppLocalizations.of(context)!.password,
    );
  }
}
