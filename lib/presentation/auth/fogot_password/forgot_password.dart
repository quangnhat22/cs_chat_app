library forgot_password;

import 'package:chatapp/common/widgets/stateless/button/float_back_button.dart';
import 'package:chatapp/core/config/app_color.dart';
import 'package:chatapp/presentation/auth/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/screen_utils.dart';


part "pages/forgot_password_step1.dart";
part "pages/forgot_password_step2.dart";
part "pages/forgot_password_step3.dart";
part "pages/forgot_password_step4.dart";
part "widgets/go_back_btn.dart";
part 'widgets/form/forgot_pass_form.dart';
part 'widgets/blue_send_btn.dart';
part 'widgets/form/validate_sendcode_form.dart';
part "widgets/send_code_again_btn.dart";
part "widgets/build_square.dart";
part 'widgets/form/confirm_new_pass_form.dart';
part "widgets/short_card.dart";

