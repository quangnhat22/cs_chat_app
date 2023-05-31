library login;

import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/auth/login/widgets/form_login.dart';
import 'package:chatapp/presentation/loading/loading_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app/bloc/app_bloc.dart';
import './bloc/login_bloc.dart';
import '../../../common/widgets/stateless/auth_header.dart';
import '../../../common/widgets/stateless/button/custom_elevated_button.dart';
import '../../../common/widgets/stateless/button/custom_outline_button.dart';
import '../../../common/widgets/stateless/card/auth_form_card.dart';
import '../../../common/widgets/stateless/divider/divider_with_text.dart';
import '../../../common/widgets/stateless/text_field/email_text_form_field.dart';
import '../../../common/widgets/stateless/text_field/password_text_form_field.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/config/app_text_style.dart';
import '../../../core/routes/route_name.dart';

part "pages/login_page.dart";
part "widgets/forgot_password_text_button.dart";
part "widgets/login_form.dart";
part "widgets/login_with_google.dart";
part "widgets/sign_in_button.dart";
part "widgets/sign_up_text_button.dart";
