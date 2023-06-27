import 'package:chatapp/domain/entities/group_request_entity.dart';

import '../../entities/message_entity.dart';

abstract class GroupRepository {
  Future<bool> createGroup(String name, String? imageUrl, List<String> members);

  //Future<List<GroupEntity>> getListGroup();

  Future<List<GroupRequestEntity>> getSentRequest();

  Future<List<GroupRequestEntity>> getReceiveRequest();

  Future<bool> rejectRequest(String id);

  Future<bool> sendGroupRequest(String groupId, String friendId);

  Future<bool> recallGroupRequest(String groupId, String friendId);

  Future<bool> acceptRequestt(String groupId);

  Future<bool> leaveGroup(String grouId);

  Future<List<MessageEntity>> getListChatWithGroup(
      {required String groupId, String? latestMessageId, int? limit});

  Future<bool> inviteNewMember(
      {required String groupId, List<String>? membersId});

  Future<bool> updateGroup(
      {required String groupId, String? groupName, String? groupAvatar});
}
