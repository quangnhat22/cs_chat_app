import 'package:chatapp/common/widgets/stateless/form/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputLoginEmail extends StatelessWidget {
  const InputLoginEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      key: const Key('signUpForm_emailInput_textField'),
      icon: const Icon(Icons.email_outlined),
      // onChange: (email) =>
      //     {context.read<SignUpCubit>().emailChanged(email)},
      label: AppLocalizations.of(context)!.email_label,
      // errorText: state.email.displayError != null
      //     ? state.email.error?.message
      //     : null,
    );
  }
}
