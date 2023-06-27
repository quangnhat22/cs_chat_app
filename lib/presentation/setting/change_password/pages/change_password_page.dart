

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/change_password_form.dart';
import '../widgets/change_password_page_app_bar.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChangePasswordView();
  }
}

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: ChangePassWordPageAppBar(
          title: AppLocalizations.of(context)!.change_password,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ChangePasswordForm(),
          ),
        ),
      );
  }
}
