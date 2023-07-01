library groups_request;

import 'package:chatapp/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import '../../../core/di/injector.dart';
import '../../../core/utils/date_time_format.dart';
import '../../../core/utils/snack_bar.dart';
import '../../../domain/entities/group_request_entity.dart';
import '../../others/refresh_page.dart';
import 'bloc/list_group_request_bloc.dart';
import 'cubit/group_request_action_cubit.dart';

part 'pages/group_request_page.dart';
part 'widgets/button_group_requests_segmented.dart';
part 'widgets/list_request_group_receive.dart';
part 'widgets/list_request_group_send.dart';
part 'widgets/something_wrong.dart';
