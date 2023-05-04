import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/modules/app_settings/app_settings_usecase.dart';

part 'setting_language_state.dart';
part 'setting_language_cubit.freezed.dart';

@Injectable()
class SettingLanguageCubit extends Cubit<SettingLanguageState> {
  final AppSettingsUseCase usecase;

  SettingLanguageCubit({required this.usecase})
      : super(const SettingLanguageState.initial()) {
    getCurrentLang();
  }

  Future<void> getCurrentLang() async {
    final currentLang = await usecase.getAppLang();
    emit(state.copyWith(lang: currentLang));
  }

  Future<void> appThemeChanged(String value) async {
    await usecase.setAppLang(value);
    emit(state.copyWith(lang: value));
  }
}
