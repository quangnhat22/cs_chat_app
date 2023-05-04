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
}
