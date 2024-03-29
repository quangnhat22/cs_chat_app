import 'package:chatapp/data/data_sources/firebase/auth_firebase.dart';
import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:chatapp/data/data_sources/local/local_data_src.dart';
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart';
import 'package:chatapp/domain/modules/auth/auth_repository.dart';
import 'package:chatapp/domain/modules/user/user_repository.dart';
import 'package:chatapp/service/notification_service.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/detect_info_device.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthFirebase _authFirebase;
  final AuthService _authService;
  final UserRepository _userRepo;
  final AuthLocalDataSrc _authLocalDataSrc;
  final LocalDataSrc _localDataSrc;
  final NotificationService _notificationService;

  AuthRepositoryImpl(this._authFirebase, this._authService, this._userRepo,
      this._authLocalDataSrc, this._localDataSrc, this._notificationService);

  @override
  Stream<String?> checkAccessTokenStream() {
    return _authLocalDataSrc.getAccessTokenStream();
  }

  @override
  Stream<String?> checkRefreshTokenStream() {
    return _authLocalDataSrc.getRefreshTokenStream();
  }

  @override
  Future<bool> checkIsLoggedIn() async {
    final isTokenLocalAvailable = await _authLocalDataSrc.checkTokenValid();
    return isTokenLocalAvailable;
  }

  @override
  Future<void> loginWithGoogle() async {
    try {
      final userCredential = await _authFirebase.signInWithGoogle();
      final idToken = await userCredential.user?.getIdToken();
      if (idToken != null) {
        // get device name
        final deviceName = await DetectDeviceInfo.getDeviceName();
        final fcmToken = await _getFCMToken();
        //call api
        final res = await _authService.loginWithFirebase(
            idToken: idToken, deviceName: deviceName, fcmToken: fcmToken);
        // handle res data
        if (res.statusCode == 200) {
          final data = res.data["data"];
          await _authLocalDataSrc.saveAuth(
            accessToken: data["access_token"]["token"],
            refreshToken: data["refresh_token"]["token"],
          );
          await _userRepo.getSelf();
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      // get device name
      final deviceName = await DetectDeviceInfo.getDeviceName();
      final fcmToken = await _getFCMToken();
      //call api
      final res = await _authService.login(
        email: email,
        password: password,
        deviceName: deviceName,
        fcmToken: fcmToken,
      );
      // handle res data
      if (res.statusCode == 200) {
        final data = res.data["data"];
        await _authLocalDataSrc.saveAuth(
          accessToken: data["access_token"]["token"],
          refreshToken: data["refresh_token"]["token"],
          isEmailVerify: data["email_verified"],
          isProfileUpdate: data["profile_updated"],
        );

        await _userRepo.getSelf();
        // await _sendEmailVerify();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      // get device name
      final deviceName = await DetectDeviceInfo.getDeviceName();
      final fcmToken = await _getFCMToken();
      //call api
      final res = await _authService.register(
          email: email,
          password: password,
          deviceName: deviceName,
          fcmToken: fcmToken);

      // handle res data
      if (res.statusCode == 200) {
        final data = res.data["data"];
        await _authLocalDataSrc.saveAuth(
          accessToken: data["access_token"]["token"],
          refreshToken: data["refresh_token"]["token"],
          isEmailVerify: data["email_verified"],
          isProfileUpdate: data["profile_updated"],
        );
        await _userRepo.getSelf();
        // await _sendEmailVerify();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<void> _sendEmailVerify() async {
  //   final isVerifyEmail = await _authLocalDataSrc.getIsVerifyEmail();
  //   if (isVerifyEmail) {
  //     await _authService.sendVerifyEmail();
  //   }
  // }

  @override
  Future<bool> updatePassword(String? password, String? oldPassword) async {
    try {
      final res =
          await _authService.updatePassword(password ?? "", oldPassword ?? "");
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> forgotPassword(String email) async {
    try {
      final res = await _authService.forgotPassword(email);

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _authService.logOut();
      await _authFirebase.logOut();
    } finally {
      await _localDataSrc.deleteAll();
    }
  }

  Future<String?> _getFCMToken() async {
    return await _notificationService.getFirebaseMessagingToken();
  }
}
