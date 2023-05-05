import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthLocalDataSrc {
  static Box? _box;
  final String _authBox = "auth_box";
  final String _accessTokenKeyName = "access_token_key";
  final String _refreshTokenKeyName = "refresh_token_key";
  final String _emailVerifyKeyname = "email_verify_key";
  final String _profileUpdateKeyname = "profile_update_key";

  Future<Box> _openBox() async {
    _box ??= await Hive.openBox(_authBox);
    return _box!;
  }

  Future<void> saveAuth(
    String accessToken,
    String refreshToken, {
    bool isEmailVerify = true,
    bool isProfileUpdate = true,
  }) async {
    await _openBox().then((box) async {
      await box.put(_accessTokenKeyName, accessToken);
      await box.put(_refreshTokenKeyName, refreshToken);
      await box.put(_emailVerifyKeyname, isEmailVerify);
      await box.put(_profileUpdateKeyname, isProfileUpdate);
    });
  }

  Future<bool> checkTokenValid() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    log(accessToken ?? "", name: "accessToken");
    log(refreshToken ?? "", name: "refreshToken");
    if (accessToken != null && refreshToken != null) {
      return true;
    }
    return false;
  }

  Future<String?> getAccessToken() async {
    return await _openBox().then((box) {
      return box.get(_accessTokenKeyName, defaultValue: null);
    });
  }

  Future<String?> getRefreshToken() async {
    return await _openBox().then((box) {
      return box.get(_refreshTokenKeyName, defaultValue: null);
    });
  }

  Future<bool> getIsVerifyEmail() async {
    return await _openBox().then((box) {
      return box.get(_emailVerifyKeyname, defaultValue: true);
    });
  }

  Future<bool?> getIsUpdateProfile() async {
    return await _openBox().then((box) {
      return box.get(_profileUpdateKeyname, defaultValue: true);
    });
  }

  Stream<String?> getAccessTokenStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _accessTokenKeyName).map((event) {
      return event.value;
    });
  }

  Stream<String?> getRefreshTokenStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _refreshTokenKeyName).map((event) {
      return event.value;
    });
  }

  Stream<bool> getIsVerifyEmailStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _emailVerifyKeyname).map((event) {
      return event.value;
    });
  }

  Stream<bool?> getIsUpdateProfileStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _profileUpdateKeyname).map((event) {
      return event.value;
    });
  }

  Future<void> deleteBoxAuth() async {
    // getBox().then((box) {
    //   return print(
    //       box.get(refreshTokenKeyName, defaultValue: "no refresh token"));
    // });
    await Hive.box(_authBox).clear();
    // _openBox().then((box) {
    //   return print(
    //       box.get(_accessTokenKeyName, defaultValue: "no refresh token"));
    // });
  }
}
