library notifications_lib;

import 'package:chatapp/common/widgets/stateless/app_bar/m_home_app_bar.dart';
import 'package:chatapp/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/notification_bloc.dart';
import 'widgets/notification_item.dart';

part 'page/notification_page.dart';
part 'widgets/notification_list.dart';
