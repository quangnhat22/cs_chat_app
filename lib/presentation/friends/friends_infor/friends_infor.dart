library friends_infor;

import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './friend_info_cubit/friend_info_cubit.dart';
import '../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import '../../../core/utils/date_time_format.dart';

part 'pages/friends_infor_page.dart';
part 'widgets/friend_actions.dart';
part 'widgets/friend_details_infor.dart';
part 'widgets/friend_mutual_infor.dart';
