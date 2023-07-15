import 'package:chatapp/data/data_sources/firebase/file_firebase.dart';
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/modules/user/user_repository.dart';
import '../data_sources/remote/service/user_service.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserService service;
  final UserLocalDataSrc local;
  final FileStorageFirebase storageFirebase;

  UserRepositoryImpl(
      {required this.service,
      required this.local,
      required this.storageFirebase});

  @override
  Future<bool> updateSelf(String? name, String? avatar, String? gender,
      String? phone, DateTime? birthday, String? bio) async {
    try {
      final res = await service.updateSelf(
          name: name,
          avatar: avatar,
          gender: gender,
          phone: phone,
          birthday: birthday,
          bio: bio);
      if (res.statusCode == 200) {
        await local.updateUser(
          name: name,
          avatar: avatar,
          gender: gender,
          phone: phone,
          birthday: birthday,
          bio: bio,
          isProfileUpdate: true,
        );
        // await getSelf();
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
    final userEntity = UserEntity.convertToUserEntity(userModel: userModel);
    return userEntity;
  }

  @override
  Future<UserEntity?> getUserByEmail(String email) async {
    try {
      final res = await service.getUserDetailByEmail(email);
      if (res.statusCode == 200) {
        final resultFriend = UserModel.fromJson(res.data["data"]);
        return UserEntity.convertToUserEntity(userModel: resultFriend);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserEntity?> getUserById(String id) async {
    try {
      final res = await service.getUserDetailById(id);
      if (res.statusCode == 200) {
        final resultFriend = UserModel.fromJson(res.data["data"]);
        return UserEntity.convertToUserEntity(userModel: resultFriend);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<UserEntity?> getStreamSelfFromLocal() {
    return local.getUserStream().map((usermodel) {
      if (usermodel == null) return null;
      return UserEntity.convertToUserEntity(userModel: usermodel);
    });
  }

  @override
  Future<void> clearBox() async {
    await local.deleteBoxUser();
  }

  @override
  Future<bool> updateAvatar(String? filePath) async {
    try {
      if (filePath == null) return false;
      final urlImage = await storageFirebase.uploadFile(filePath);
      final res = await service.updateSelf(
        avatar: urlImage,
      );
      if (res.statusCode == 200) {
        await local.updateUser(
          avatar: urlImage,
        );
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
