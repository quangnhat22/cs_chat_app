library create_group;

import 'dart:io';

import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/core/config/app_text_style.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/presentation/group/create_group/widgets/input_group_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/stateless/dialog/asset_dialog.dart';
import '../../../core/utils/assets_picker.dart';
import 'cubit_create_group_form/create_group_cubit.dart';

part 'page/create_group_page.dart';
part 'widgets/group_add_member.dart';
part 'widgets/group_set_photo.dart';
