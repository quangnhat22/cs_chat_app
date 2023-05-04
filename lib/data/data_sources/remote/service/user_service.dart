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
      return await _service.dio.put(
        "${BaseService.userPath}/self",
        data: {
          "name": name,
          "avatar": avatar ?? "https://picsum.photos/200",
          "gender": gender?.toLowerCase(),
          "phone": phone,
          "birthday": birthday?.toIso8601String(),
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getUserDetailByEmail(String? email) async {
    try {
      return await _service.dio.get(
        "${BaseService.userPath}?email=$email",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getUserDetailById(String? id) async {
    try {
      return await _service.dio.get(
        "${BaseService.userPath}/$id",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getSelf() async {
    try {
      return await _service.dio.get(
        "${BaseService.userPath}/self",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
