import 'package:chatapp/data/data_sources/firebase/file_firebase.dart';
import 'package:chatapp/data/data_sources/remote/service/group_service.dart';
import 'package:chatapp/domain/modules/group/group_repository.dart';
import 'package:injectable/injectable.dart';

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
      String name, String imageUrl, List<String> members) async {
    try {
      final imageAvatarUrl = await _storageFirebase.uploadFile(imageUrl);
      final res =
          await _groupService.createGroup(name, imageAvatarUrl ?? "", members);
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
  Future<void> getListGroup() {
    // TODO: implement getListGroup
    throw UnimplementedError();
  }

  @override
  Future<void> getReceiveRequest() {
    // TODO: implement getReceiveRequest
    throw UnimplementedError();
  }

  @override
  Future<void> getSentRequest() {
    // TODO: implement getSentRequest
    throw UnimplementedError();
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
