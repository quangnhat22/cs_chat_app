import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart';
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LocalDataSrc {
  final AuthLocalDataSrc _authLocalDataSrc;
  final SettingLocalDataSrc _settingLocalDataSrc;
  final UserLocalDataSrc _userLocalDataSrc;

  LocalDataSrc(this._authLocalDataSrc, this._settingLocalDataSrc,
      this._userLocalDataSrc);

  Future<void> deleteAll() async {
    await _settingLocalDataSrc.deleteBox();
    await _userLocalDataSrc.deleteBoxUser();
    await _authLocalDataSrc.deleteBoxAuth();
  }

  // Future<void> deleteCacheAndAppDir() async {
  //   await _deleteCacheDir();
  //   await _deleteAppDir();
  // }

  // Future<void> _deleteCacheDir() async {
  //   final cacheDir = await getTemporaryDirectory();

  //   if (cacheDir.existsSync()) {
  //     cacheDir.deleteSync(recursive: true);
  //   }
  // }

  // Future<void> _deleteAppDir() async {
  //   final appDir = await getApplicationSupportDirectory();

  //   if (appDir.existsSync()) {
  //     appDir.deleteSync(recursive: true);
  //   }
  // }
}
