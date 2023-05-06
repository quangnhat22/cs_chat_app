library find_new_friend;

import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/common/widgets/stateless/button/custom_elevated_button.dart';
import 'package:chatapp/common/widgets/stateless/text_field/c_text_form_field.dart';
import 'package:chatapp/core/config/app_assets.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart';
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/di/injector.dart';

part 'pages/find_new_friend.dart';
part 'widgets/input_find_friend.dart';
part 'widgets/button_find_friend.dart';
part 'widgets/not_found_result.dart';
