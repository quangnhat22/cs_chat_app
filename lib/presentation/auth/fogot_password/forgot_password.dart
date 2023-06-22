library forgot_password;

import 'package:chatapp/common/widgets/stateless/button/custom_text_button.dart';
import 'package:chatapp/core/config/app_color.dart';
import 'package:chatapp/core/config/app_text_style.dart';
import 'package:chatapp/presentation/auth/fogot_password/cubit_forgot_pasword/forgot_password_cubit.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/stateless/button/countdown_button_send.dart';
import '../../../common/widgets/stateless/button/custom_elevated_button.dart';
import '../../../common/widgets/stateless/form/text_field.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/di/injector.dart';

part 'pages/forgot_password_page.dart';
part 'pages/forgot_password_step1_view.dart';
part 'pages/success_confirm_view.dart';
part 'widgets/forgot_pass_form.dart';
part "widgets/go_back_btn.dart";
part "widgets/send_code_again_btn.dart";
part "widgets/send_form_btn.dart";
part "widgets/short_card.dart";
