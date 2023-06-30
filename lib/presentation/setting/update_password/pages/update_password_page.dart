import 'package:chatapp/presentation/setting/update_password/widgets/update_password_form.dart';
import 'package:chatapp/presentation/setting/update_password/widgets/update_password_page_app_%20bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdatePasswordView();
  }
}

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdatePasswordPageAppBar(
        title: AppLocalizations.of(context)!.change_password,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: UpdatePasswordForm(),
        ),
      ),
    );
  }
}
