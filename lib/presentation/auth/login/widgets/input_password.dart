import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/form/password_text_field.dart';

class InputPassword extends StatelessWidget {
  const InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CPasswordTextField(
      key: const Key('signUpForm_passwordInput_textField'),
      label: AppLocalizations.of(context)!.confirm_password,
      // onChange: (password) =>
      //     context.read<SignUpCubit>().passwordChanged(password),
      // errorText: state.password.displayError != null
      //     ? state.password.error?.message
      //     : null,
    );
  }
}
