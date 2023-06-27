import 'package:chatapp/domain/entities/group_request_entity.dart';
import 'package:chatapp/domain/modules/group/group_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/message_entity.dart';

abstract class GroupUseCase {
  Future<bool> createGroup(String name, String? imageUrl, List<String> members);

  //Future<List<GroupEntity>> getListGroup();

  Future<List<GroupRequestEntity>> getSentRequest();

  Future<List<GroupRequestEntity>> getReceiveRequest();

  Future<bool> rejectRequest(String id);

  Future<bool> sendGroupRequest(String groupId, String friendId);

  Future<bool> recallGroupRequest(String groupId, String friendId);

  Future<bool> acceptRequest(String groupId);

  Future<bool> leaveGroup(String grouId);

  Future<List<MessageEntity>> getListChatWithGroup(
      {required String groupId, String? latestMessageId, int? limit});

  Future<bool> inviteNewMember(
      {required String groupId, List<String>? membersId});

  Future<bool> updateGroup(
      {required String groupId, String? groupName, String? groupAvatar});
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

  // @override
  // Future<List<GroupEntity>> getListGroup() {
  //   return _repo.getListGroup();
  // }

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
    return _repo.getListChatWithGroup(
        groupId: groupId, latestMessageId: latestMessageId, limit: limit);
  }

  @override
  Future<bool> leaveGroup(String grouId) {
    return _repo.leaveGroup(grouId);
  }

  @override
  Future<bool> inviteNewMember(
      {required String groupId, List<String>? membersId}) {
    return _repo.inviteNewMember(groupId: groupId, membersId: membersId);
  }

  @override
  Future<bool> updateGroup(
      {required String groupId, String? groupName, String? groupAvatar}) {
    return _repo.updateGroup(
        groupId: groupId, groupAvatar: groupAvatar, groupName: groupName);
  }
}
