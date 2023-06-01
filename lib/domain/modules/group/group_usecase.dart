import 'package:chatapp/domain/modules/group/group_repository.dart';
import 'package:injectable/injectable.dart';

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

@Injectable(as: GroupUseCase)
class GroupUseCaseImpl extends GroupUseCase {
  final GroupRepository _repo;

  GroupUseCaseImpl({required GroupRepository groupRepo}) : _repo = groupRepo;

  @override
  Future<bool> acceptRequestt(String groupId) {
    return _repo.acceptRequestt(groupId);
  }

  @override
  Future<bool> createGroup(String name, String imageUrl, List<String> members) {
    return _repo.createGroup(name, imageUrl, members);
  }

  @override
  Future<void> getListGroup() {
    return _repo.getListGroup();
  }

  @override
  Future<void> getReceiveRequest() {
    return _repo.getReceiveRequest();
  }

  @override
  Future<void> getSentRequest() {
    return _repo.getSentRequest();
  }

  @override
  Future<bool> recallGroupRequest(String groupId, String friendId) {
    return _repo.recallGroupRequest(groupId, friendId);
  }

  @override
  Future<bool> rejectRequest(String id) {
    return rejectRequest(id);
  }

  @override
  Future<bool> sendGroupRequest(String groupId, String friendId) {
    return sendGroupRequest(groupId, friendId);
  }
}
