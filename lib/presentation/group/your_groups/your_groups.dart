library your_groups;

import 'package:chatapp/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/widgets/stateless/button/float_action_stadium_button.dart';
import '../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import '../../../core/di/injector.dart';
import '../../../core/routes/app_navigation.dart';
import '../../../core/routes/route_name.dart';
import '../../../domain/entities/group_entity.dart';
import 'bloc/list_group_bloc.dart';

part 'pages/your_groups_page.dart';
part 'widgets/group_list.dart';
part 'widgets/group_list_item.dart';
