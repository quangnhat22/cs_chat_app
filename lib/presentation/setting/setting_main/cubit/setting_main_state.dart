part of 'setting_main_cubit.dart';

@freezed
class SettingMainState with _$SettingMainState {
  const factory SettingMainState.initial({
    @Default("") String theme,
    @Default("") String lang,
  }) = _Initial;
}
