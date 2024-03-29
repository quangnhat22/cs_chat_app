import 'package:chatapp/presentation/setting/update_password/widgets/btn_change_password.dart';
import 'package:chatapp/presentation/setting/update_password/widgets/input_confirm_password.dart';
import 'package:chatapp/presentation/setting/update_password/widgets/input_new_password.dart';
import 'package:chatapp/presentation/setting/update_password/widgets/input_old_password.dart';
import 'package:flutter/material.dart';

class UpdatePasswordForm extends StatefulWidget {
  const UpdatePasswordForm({super.key});

  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: const <Widget>[
            InputOldPassword(),
            SizedBox(
              height: 4,
            ),
            InputNewPassword(),
            SizedBox(
              height: 4,
            ),
            InputConfirmPassword(),
            SizedBox(
              height: 8,
            ),
            BtnChangePassword(),
          ],
        ),
      ),
    );
  }
}
