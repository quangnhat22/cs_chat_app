import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_service.dart';

@LazySingleton()
class AuthService {
  final BaseService _service;

  AuthService({required BaseService service}) : _service = service;

  Future<Response> loginWithFirebase(
    String idToken,
    String deviceName,
  ) async {
    try {
      return await _service.dio.post(
        BaseService.authLoginWithFirebasePath,
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
}
