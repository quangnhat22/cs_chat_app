import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart';
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppSettingsRepository)
class AppSettingsRepositoryImpl implements AppSettingsRepository {
  const AppSettingsRepositoryImpl({required SettingLocalDataSrc localDataSrc})
      : _local = localDataSrc;

  final SettingLocalDataSrc _local;

  @override
  Future<String> getAppLanguage() async {
    return await _local.getLangValue();
  }

  @override
  Future<String> getAppTheme() async {
    return await _local.getThemeValue();
  }

  @override
  Future<void> setAppLanguage(String value) {
    return _local.setLangLocal(value);
  }

  @override
  Future<void> setAppTheme(String value) {
    return _local.setThemeLocal(value);
  }

  @override
  Stream<String?> getThemeStream() {
    return _local.getThemeStream();
  }

  @override
  Stream<String?> getLanguageStream() {
    return _local.getLangStream();
  }
}
