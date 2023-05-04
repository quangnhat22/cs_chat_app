library edit_profile;

import 'dart:developer';

import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/stateless/app_bar/m_page_app_bar.dart';
import '../../../common/widgets/stateless/button/custom_elevated_button.dart';
import '../../../common/widgets/stateless/list_tile/radio_list_tile.dart';
import '../../../common/widgets/stateless/text_field/c_text_form_field.dart';
import '../../../core/config/app_enum.dart';

part 'pages/edit_profile.page.dart';
part 'widgets/form_edit_profile.dart';
part 'widgets/input_full_name.dart';
part 'widgets/input_phone_number.dart';
part 'widgets/input_bio.dart';
part 'widgets/birthday_input.dart';
part 'widgets/gender_input.dart';
part 'widgets/gender_dialog.dart';
