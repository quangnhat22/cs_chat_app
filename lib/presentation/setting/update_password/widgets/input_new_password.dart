import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/form/text_field.dart';

class InputNewPassword extends StatefulWidget {
  const InputNewPassword({super.key});

  @override
  State<InputNewPassword> createState() => _InputNewPasswordState();
}

class _InputNewPasswordState extends State<InputNewPassword> {
  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      icon: const Icon(Icons.vpn_key),
      label: AppLocalizations.of(context)!.new_password,
    );
  }
}
