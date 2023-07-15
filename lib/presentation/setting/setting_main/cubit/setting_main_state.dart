part of 'setting_main_cubit.dart';

@freezed
class SettingMainState with _$SettingMainState {
  const factory SettingMainState.initial({
    String? avatar,
    String? name,
    String? email,
    @Default(true) bool isTurnOnNotifi,
    @Default("") String theme,
    @Default("") String lang,
  }) = _Initial;
}
