library device_administration_lib;

import 'package:chatapp/presentation/device/widgets/device_list_item.dart';
import 'package:chatapp/presentation/device/widgets/segment_button_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/stateless/app_bar/m_page_app_bar.dart';
import '../../core/config/app_text_style.dart';
import '../../core/di/injector.dart';
import 'bloc/list_device_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'device_page/device_page.dart';
part 'widgets/device_list.dart';
part 'widgets/small_elevated_btn.dart';
