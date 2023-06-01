library login;

import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/auth/login/cubit_login/login_cubit.dart';
import 'package:chatapp/presentation/loading/loading_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../../common/widgets/stateless/auth_header.dart';
import '../../../common/widgets/stateless/button/custom_elevated_button.dart';
import '../../../common/widgets/stateless/button/custom_outline_button.dart';
import '../../../common/widgets/stateless/divider/divider_with_text.dart';
import '../../../common/widgets/stateless/form/password_text_field.dart';
import '../../../common/widgets/stateless/form/text_field.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/config/app_text_style.dart';
import '../../../core/routes/route_name.dart';
import '../../../core/utils/screen_utils.dart';

part "pages/login_page.dart";
part 'widgets/button_sign_in.dart';
part 'widgets/form_login.dart';
part 'widgets/input_login_email.dart';
part 'widgets/input_password.dart';
part "widgets/login_with_google.dart";
part "widgets/text_btn_forgot_password.dart";
part "widgets/text_btn_sign_up.dart";
