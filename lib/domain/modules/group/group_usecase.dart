abstract class GroupUseCase {
  Future<bool> createGroup(String name, String imageUrl, List<String> members);

  Future<void> getListGroup();

  Future<void> getSentRequest();

  Future<void> getReceiveRequest();

  Future<bool> rejectRequest(String id);

  Future<bool> sendGroupRequest(String groupId, String friendId);

  Future<bool> recallGroupRequest(String groupId, String friendId);

  Future<bool> acceptRequestt(String groupId);
}
