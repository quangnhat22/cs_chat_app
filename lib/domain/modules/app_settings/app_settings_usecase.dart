import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart';
import 'package:injectable/injectable.dart';

abstract class AppSettingsUseCase {
  Future<void> setAppTheme(String value);
  Future<String> getAppTheme();
  Stream<String?> getAppThemeStream();
  Future<void> setAppLang(String value);
  Future<String> getAppLang();
  Stream<String?> getAppLangStream();
}

@Injectable(as: AppSettingsUseCase)
class AppSettingsUseCaseImpl extends AppSettingsUseCase {
  AppSettingsUseCaseImpl({required this.repo});

  final AppSettingsRepository repo;

  @override
  Future<void> setAppTheme(String value) async {
    return await repo.setAppTheme(value);
  }

  @override
  Future<String> getAppTheme() async {
    return await repo.getAppTheme();
  }

  @override
  Stream<String?> getAppThemeStream() {
    return repo.getThemeStream();
  }

  @override
  Future<void> setAppLang(String value) async {
    return await repo.setAppLanguage(value);
  }

  @override
  Future<String> getAppLang() async {
    return await repo.getAppLanguage();
  }

  @override
  Stream<String?> getAppLangStream() {
    return repo.getLanguageStream();
  }
}
