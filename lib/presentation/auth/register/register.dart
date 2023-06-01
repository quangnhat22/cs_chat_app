library register;

import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/presentation/auth/register/cubit_sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../../common/widgets/stateless/auth_header.dart';
import '../../../common/widgets/stateless/button/custom_elevated_button.dart';
import '../../../common/widgets/stateless/button/custom_text_button.dart';
import '../../../common/widgets/stateless/form/password_text_field.dart';
import '../../../common/widgets/stateless/form/text_field.dart';
import '../../../core/utils/screen_utils.dart';
import '../../../core/utils/snack_bar.dart';

part 'pages/register_page.dart';
part 'widgets/button_sign_up.dart';
part 'widgets/form_sign_up.dart';
part 'widgets/input_confirm_password.dart';
part 'widgets/input_email.dart';
part 'widgets/input_password.dart';
part 'widgets/text_btn_back_to_login.dart';
