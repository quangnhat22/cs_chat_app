library friends_request;

import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/date_time_format.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/domain/entities/friend_request_entity.dart';
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart';
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import '../../others/empty_page.dart';

part 'pages/friends_request_page.dart';
part 'widgets/segment_button_friend_request.dart';
part 'widgets/list_request_friend_receive.dart';
part 'widgets/list_request_friend_send.dart';
part 'widgets/something_wrong.dart';
