import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_service.dart';

@LazySingleton()
class AuthService {
  final BaseService _service;

  AuthService({required BaseService service}) : _service = service;

  Future<Response> register(
    String email,
    String password,
    String deviceName,
  ) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/register",
        data: {
          "data": {"email": email, "password": password},
          "device": {"name": deviceName},
        },
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> loginWithFirebase(
    String idToken,
    String deviceName,
  ) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/login-with-firebase",
        data: {
          "id_token": idToken,
          "device": {
            "name": deviceName,
          }
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> login(
    String email,
    String password,
    String deviceName,
  ) async {
    try {
      return await _service.dio.post(
        "${BaseService.authPath}/login",
        data: {
          "data": {"email": email, "password": password},
          "device": {"name": deviceName},
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
}
