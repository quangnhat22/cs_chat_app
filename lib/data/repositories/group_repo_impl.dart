import 'package:chatapp/data/data_sources/firebase/file_firebase.dart';
import 'package:chatapp/data/data_sources/remote/service/group_service.dart';
import 'package:chatapp/data/models/group_model.dart';
import 'package:chatapp/data/models/group_request_model.dart';
import 'package:chatapp/domain/entities/group_request_entity.dart';
import 'package:chatapp/domain/modules/group/group_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/group_entity.dart';

@Injectable(as: GroupRepository)
class GroupRepoImpl extends GroupRepository {
  final GroupService _groupService;
  final FileStorageFirebase _storageFirebase;

  GroupRepoImpl({
    required GroupService groupService,
    required FileStorageFirebase storageFirebase,
  })  : _groupService = groupService,
        _storageFirebase = storageFirebase;

  @override
  Future<bool> acceptRequestt(String groupId) async {
    try {
      final res = await _groupService.acceptRequest(groupId);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> createGroup(
      String name, String? imageUrl, List<String> members) async {
    try {
      String? avatarUrl = "";
      if (imageUrl != null) {
        avatarUrl = await _storageFirebase.uploadFile(imageUrl);
      }
      final res =
          await _groupService.createGroup(name, avatarUrl ?? "", members);
      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<GroupEntity>> getListGroup() async {
    try {
      final res = await _groupService.getListGroup();
      if (res.statusCode == 200) {
        final listGroupJson = res.data["data"] as List<dynamic>?;
        if (listGroupJson != null) {
          final listGroupModel = listGroupJson
              .map((groupJson) => GroupModel.fromJson(groupJson))
              .toList();

          final listGroupEntity = listGroupModel
              .map((groupModel) =>
                  GroupEntity.convertToGroupEntity(groupModel: groupModel))
              .toList();

          return listGroupEntity;
        }
      }

      // return [];
      return List<GroupEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<GroupRequestEntity>> getReceiveRequest() async {
    try {
      final res = await _groupService.getReceiveRequest();
      if (res.statusCode == 200) {
        final listGroupJson = res.data["data"] as List<dynamic>?;
        if (listGroupJson != null) {
          final receiveModels = listGroupJson
              .map((receiveJson) => GroupRequestModel.fromJson(receiveJson))
              .toList();

          final receiveEntities = receiveModels
              .map((receiveEntity) =>
                  GroupRequestEntity.convertToGroupRequestEntity(
                      model: receiveEntity))
              .toList();

          return receiveEntities;
        }
      }

      return List<GroupRequestEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<GroupRequestEntity>> getSentRequest() async {
    try {
      final res = await _groupService.getSentRequest();
      if (res.statusCode == 200) {
        final listGroupJson = res.data['data'] as List<dynamic>?;

        if (listGroupJson != null) {
          final sendModels = listGroupJson
              .map((sendModel) => GroupRequestModel.fromJson(sendModel))
              .toList();

          final sendEntities = sendModels
              .map((sendEntity) =>
                  GroupRequestEntity.convertToGroupRequestEntity(
                      model: sendEntity))
              .toList();

          return sendEntities;
        }
      }

      return List<GroupRequestEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> recallGroupRequest(String groupId, String friendId) async {
    try {
      final res = await _groupService.recallGroupRequest(groupId, friendId);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> rejectRequest(String id) async {
    try {
      final res = await _groupService.rejectRequest(id);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> sendGroupRequest(String groupId, String friendId) async {
    try {
      final res = await _groupService.sendGroupRequest(groupId, friendId);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
