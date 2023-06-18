import 'package:chatapp/domain/entities/group_entity.dart';
import 'package:chatapp/domain/entities/group_request_entity.dart';
import 'package:chatapp/domain/modules/group/group_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/message_entity.dart';

abstract class GroupUseCase {
  Future<bool> createGroup(String name, String? imageUrl, List<String> members);

  Future<List<GroupEntity>> getListGroup();

  Future<List<GroupRequestEntity>> getSentRequest();

  Future<List<GroupRequestEntity>> getReceiveRequest();

  Future<bool> rejectRequest(String id);

  Future<bool> sendGroupRequest(String groupId, String friendId);

  Future<bool> recallGroupRequest(String groupId, String friendId);

  Future<bool> acceptRequest(String groupId);

  Future<List<MessageEntity>> getListChatWithGroup(
      {required String groupId, String? latestMessageId, int? limit});
}

@Injectable(as: GroupUseCase)
class GroupUseCaseImpl extends GroupUseCase {
  final GroupRepository _repo;

  GroupUseCaseImpl({required GroupRepository groupRepo}) : _repo = groupRepo;

  @override
  Future<bool> acceptRequest(String groupId) {
    return _repo.acceptRequestt(groupId);
  }

  @override
  Future<bool> createGroup(
      String name, String? imageUrl, List<String> members) {
    return _repo.createGroup(name, imageUrl, members);
  }

  @override
  Future<List<GroupEntity>> getListGroup() {
    return _repo.getListGroup();
  }

  @override
  Future<List<GroupRequestEntity>> getReceiveRequest() {
    return _repo.getReceiveRequest();
  }

  @override
  Future<List<GroupRequestEntity>> getSentRequest() {
    return _repo.getSentRequest();
  }

  @override
  Future<bool> recallGroupRequest(String groupId, String friendId) {
    return _repo.recallGroupRequest(groupId, friendId);
  }

  @override
  Future<bool> rejectRequest(String id) {
    return _repo.rejectRequest(id);
  }

  @override
  Future<bool> sendGroupRequest(String groupId, String friendId) {
    return _repo.sendGroupRequest(groupId, friendId);
  }

  @override
  Future<List<MessageEntity>> getListChatWithGroup(
      {required String groupId, String? latestMessageId, int? limit}) {
    return _repo.getListChatWithGroup(groupId: groupId);
  }
}
