import 'package:chatapp/data/data_sources/local/user_local_data_src.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:chatapp/domain/entities/user_entities.dart';
import 'package:injectable/injectable.dart';

import '../../domain/modules/user/user_repository.dart';
import '../data_sources/remote/service/user_service.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserService service;
  final UserLocalDataSrc local;

  UserRepositoryImpl({required this.service, required this.local});

  @override
  Future<bool> updateSelf(String? name, String? avatar, String? gender,
      String? phone, DateTime? birthday, String? bio) async {
    try {
      final res =
          await service.updateSelf(name, avatar, gender, phone, birthday, bio);
      if (res.statusCode == 200) {
        await local.updateUser(
          name: name,
          avatar: avatar,
          gender: gender,
          phone: phone,
          birthday: birthday,
          bio: bio,
        );
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> getSelf() async {
    try {
      final res = await service.getSelf();

      // save to local
      if (res.statusCode == 200) {
        final userInfo = UserModel.fromJson(res.data["data"]);
        local.setUser(userInfo);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserEntity?> getSelfFromLocal() async {
    final userModel = await local.getUser();
    if (userModel == null) return null;
    final userEnity = UserEntity.convertToUserEntity(
      id: userModel.id,
      name: userModel.name,
      avatar: userModel.avatar,
      email: userModel.email,
      phone: userModel.phone,
      gender: userModel.gender,
      birthday: userModel.birthday,
      bio: userModel.bio,
    );
    return userEnity;
  }

  @override
  Future<void> getUserByEmail(String email) {
    return service.getUserDetailByEmail(email);
  }

  @override
  Future<void> getUserById(String id) {
    return service.getUserDetailById(id);
  }

  @override
  Stream<UserEntity?> getStreamSelfFromLocal() {
    return local.getUserStream().map((usermodel) {
      if (usermodel == null) return null;
      return UserEntity.convertToUserEntity(
        id: usermodel.id,
        name: usermodel.name,
        avatar: usermodel.avatar,
        email: usermodel.email,
        phone: usermodel.phone,
        gender: usermodel.gender,
        birthday: usermodel.birthday,
        bio: usermodel.bio,
      );
    });
  }

  @override
  Future<void> clearBox() async {
    await local.deleteBoxUser();
  }
}
