import 'package:chatapp/domain/modules/user/user_repository.dart';
import 'package:injectable/injectable.dart';

abstract class UserUseCase {
  Future<void> updateSelf(
      {String? name,
      String? avatar,
      String? gender,
      String? phone,
      DateTime? birthday});

  Future<void> getSelf();
}

@Injectable(as: UserUseCase)
class UserUseCaseImpl extends UserUseCase {
  final UserRepository repo;

  UserUseCaseImpl({required this.repo});

  @override
  Future<void> updateSelf(
      {String? name,
      String? avatar,
      String? gender,
      String? phone,
      DateTime? birthday}) async {
    return await repo.updateSelf(name, avatar, gender, phone, birthday);
  }

  @override
  Future<void> getSelf() async {
    return await repo.getSelf();
  }
}
