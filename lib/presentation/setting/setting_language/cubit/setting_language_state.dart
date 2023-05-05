part of 'setting_language_cubit.dart';

@freezed
class SettingLanguageState with _$SettingLanguageState {
  const factory SettingLanguageState.initial({
    @Default("System") String lang,
  }) = _Initial;
}
