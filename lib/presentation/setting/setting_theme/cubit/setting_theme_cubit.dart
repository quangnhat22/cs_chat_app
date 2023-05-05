import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/modules/app_settings/app_settings_usecase.dart';

part 'setting_theme_state.dart';
part 'setting_theme_cubit.freezed.dart';

@Injectable()
class SettingThemeCubit extends Cubit<SettingThemeState> {
  final AppSettingsUseCase usecase;

  SettingThemeCubit({required this.usecase})
      : super(const SettingThemeState.initial()) {
    getCurrentTheme();
  }

  Future<void> getCurrentTheme() async {
    final currentTheme = await usecase.getAppTheme();
    emit(state.copyWith(theme: currentTheme));
  }

  Future<void> appThemeChanged(String value) async {
    await usecase.setAppTheme(value);
    emit(state.copyWith(theme: value));
  }
}
