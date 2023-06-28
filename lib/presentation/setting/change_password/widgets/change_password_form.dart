import 'package:flutter/material.dart';

import 'input_confirm_new_password.dart';
import 'input_new_password.dart';
import 'input_password.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: const <Widget>[
            InputPassword(),
            InputNewPassword(),
            InputConfirmNewPassword(),
            // BtnChangePassword(),
          ],
        ),
      ),
    );
  }
}
