import 'package:chatapp/common/widgets/stateless/form/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputConfirmPassword extends StatefulWidget {
  const InputConfirmPassword({super.key});

  @override
  State<InputConfirmPassword> createState() => _InputConfirmPasswordState();
}

class _InputConfirmPasswordState extends State<InputConfirmPassword> {
  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      icon: const Icon(Icons.check_circle),
      label: AppLocalizations.of(context)!.confirm_password,
    );
  }
}
