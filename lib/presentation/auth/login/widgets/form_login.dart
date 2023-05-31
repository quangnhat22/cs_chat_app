import 'package:chatapp/presentation/auth/login/widgets/button_sign_in.dart';
import 'package:chatapp/presentation/auth/login/widgets/input_login_email.dart';
import 'package:chatapp/presentation/auth/login/widgets/input_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/screen_utils.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: AppScreenUtils.isLandscape() ? 1.sh : 0.7.sh,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                const InputLoginEmail(),
                const InputPassword(),
                const ButtonSignIn()
                // if (AppScreenUtils.isLandscape()) const TextButtonBackToLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
