part of 'setting_theme_cubit.dart';

@freezed
class SettingThemeState with _$SettingThemeState {
  const factory SettingThemeState.initial({
    @Default("System") String theme,
  }) = _Initial;
}
