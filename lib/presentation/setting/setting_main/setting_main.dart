library setting_main;

import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/presentation/setting/setting_language/setting_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/stateless/app_bar/m_home_app_bar.dart';
import '../../../common/widgets/stateless/button/custom_outline_button.dart';
import '../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import '../../../common/widgets/stateless/divider/divider_space_left.dart';
import '../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';
import '../../../core/di/injector.dart';
import '../../../core/utils/show_diaglog.dart';
import '../setting_theme/setting_theme.dart';
import 'cubit/setting_main_cubit.dart';

part 'pages/setting_main_page.dart';
part 'widgets/device_settings.dart';
part 'widgets/log_out_button.dart';
part 'widgets/profile_settings.dart';
