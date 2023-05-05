import 'package:chatapp/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<bool> updateSelf(
    String? name,
    String? avatar,
    String? gender,
    String? phone,
    DateTime? birthday,
    String? bio,
  );

  Future<void> getSelf();
  Future<UserEntity?> getSelfFromLocal();
  Stream<UserEntity?> getStreamSelfFromLocal();
  Future<void> getUserByEmail(String email);
  Future<void> getUserById(String id);
  Future<void> clearBox();
}
