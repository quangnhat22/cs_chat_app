import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_service.dart';

@LazySingleton()
class UserService {
  UserService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> updateSelf(
    String? name,
    String? avatar,
    String? gender,
    String? phone,
    DateTime? birthday,
  ) async {
    try {
      return await _service.dio.post(
        "${BaseService.authLoginWithFirebasePath}/self",
        data: {
          "name": name,
          "avatar": avatar,
          "gender": gender,
          "phone": phone,
          "birthday": birthday?.toIso8601String(),
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
