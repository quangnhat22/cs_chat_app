import 'package:chatapp/domain/modules/user/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/user_entities.dart';

abstract class UserUseCase {
  Future<bool> updateSelf(
      {String? name,
      String? avatar,
      String? gender,
      String? phone,
      DateTime? birthday});

  Future<void> getSelf();
  Future<UserEntity?> getSelfFromLocal();
  Stream<UserEntity?> getStreamSelfFromLocal();
  Future<void> getUserByEmail(String email);
  Future<void> getUserById(String id);
}

@Injectable(as: UserUseCase)
class UserUseCaseImpl extends UserUseCase {
  final UserRepository repo;

  UserUseCaseImpl({required this.repo});

  @override
  Future<bool> updateSelf(
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

  @override
  Future<UserEntity?> getSelfFromLocal() async {
    return await repo.getSelfFromLocal();
  }

  @override
  Stream<UserEntity?> getStreamSelfFromLocal() {
    return repo.getStreamSelfFromLocal();
  }

  @override
  Future<void> getUserByEmail(String email) {
    return repo.getUserByEmail(email);
  }

  @override
  Future<void> getUserById(String id) {
    return repo.getUserById(id);
  }
}
