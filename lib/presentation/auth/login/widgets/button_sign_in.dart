import 'package:chatapp/presentation/auth/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/button/custom_elevated_button.dart';
import '../../../../core/utils/formz/email.dart';
import '../../../../core/utils/formz/password.dart';

class ButtonSignIn extends StatelessWidget {
  const ButtonSignIn({super.key});

  void _handleLogin(BuildContext ctx, Email email, Password password) {
    ctx
        .read<LoginBloc>()
        .add(LoggedWithEmail(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return CustomElevatedButton(
        AppLocalizations.of(context)!.sign_in,
        () => _handleLogin(
          context,
        ),
        Theme.of(context).colorScheme.primary,
      );
    });
  }
}
