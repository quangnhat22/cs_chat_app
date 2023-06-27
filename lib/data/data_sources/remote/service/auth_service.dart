import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_service.dart';

@LazySingleton()
class AuthService {
  final BaseService _service;

  AuthService({required BaseService service}) : _service = service;

  Future<Response> register(
      {required String email,
      required String password,
      String? deviceName,
      String? fcmToken}) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/register",
        data: {
          "data": {"email": email, "password": password},
          "device": {
            "name": deviceName,
            "push_notification_token": fcmToken,
          },
        },
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> loginWithFirebase(
      {required String idToken, String? deviceName, String? fcmToken}) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/login-with-firebase",
        data: {
          "id_token": idToken,
          "device": {
            "name": deviceName,
            "push_notification_token": fcmToken,
          }
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> login(
      {required String email,
      required String password,
      String? deviceName,
      String? fcmToken}) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/login",
        data: {
          "data": {"email": email, "password": password},
          "device": {
            "name": deviceName,
            "push_notification_token": fcmToken,
          },
        },
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> logOut() async {
    try {
      return await _service.dio.post("${BaseService.authPath}/logout");
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> updatePassword(String password, String oldPassword) async {
    try {
      return await _service.dio.post("${BaseService.authPath}/update-password",
          data: {"password": password});
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> sendVerifyEmail() async {
    try {
      return await _service.dio
          .post("${BaseService.authPath}/send-verify-email");
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> forgotPassword(String email) async {
    try {
      return await _service.dio.post("${BaseService.authPath}/forget-password",
          data: {"email": email});
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
