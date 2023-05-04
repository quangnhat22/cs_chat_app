import 'package:chatapp/domain/entities/user_entities.dart';
import 'package:injectable/injectable.dart';

import '../../domain/modules/user/user_repository.dart';
import '../data_sources/remote/service/user_service.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserService userService;

  UserRepositoryImpl({required this.userService});

  @override
  Future<void> updateSelf(
    String? name,
    String? avatar,
    String? gender,
    String? phone,
    DateTime? birthday,
  ) async {
    try {
      await userService.updateSelf(name, avatar, gender, phone, birthday);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<Response> getUserDetailByEmail(String? email) async {
  //   try {
  //     return await _service.dio.get(
  //       "${BaseService.userPath}?email=$email",
  //     );
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // Future<Response> getUserDetailById(String? id) async {
  //   try {
  //     return await _service.dio.get(
  //       "${BaseService.userPath}/$id",
  //     );
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Future<void> getSelf() async {
    try {
      final res = await userService.getSelf();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
