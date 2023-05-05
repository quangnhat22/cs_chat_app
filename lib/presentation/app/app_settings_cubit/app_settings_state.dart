part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState.initial({
    @Default(ThemeMode.system) ThemeMode theme,
    @Default(Locale('en', 'US')) Locale locale,
  }) = _Initial;
}
