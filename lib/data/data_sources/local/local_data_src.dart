import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:chatapp/data/data_sources/local/other_local_data_src.dart';
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart';
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LocalDataSrc {
  final AuthLocalDataSrc _authLocalDataSrc;
  final SettingLocalDataSrc _settingLocalDataSrc;
  final UserLocalDataSrc _userLocalDataSrc;
  final OtherLocalDataSrc _otherLocalDataSrc;

  LocalDataSrc(this._authLocalDataSrc, this._settingLocalDataSrc,
      this._userLocalDataSrc, this._otherLocalDataSrc);

  Future<void> deleteAll() async {
    await _otherLocalDataSrc.deleteBoxOther();
    await _settingLocalDataSrc.deleteBox();
    await _userLocalDataSrc.deleteBoxUser();
    await _authLocalDataSrc.deleteBoxAuth();
  }
}
