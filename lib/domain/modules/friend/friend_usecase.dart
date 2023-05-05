import 'package:chatapp/domain/modules/friend/friend_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/friend_request_entity.dart';
import '../../entities/user_entity.dart';

abstract class FriendUseCase {
  Future<bool> sendRequest(String id);
  Future<void> getListChatWithFriends();
  Future<List<UserEntity>> getListFriend();
  Future<bool> deleteFriend(String id);
  Future<bool> blockFriend(String id);
  Future<bool> unBlockFruiend(String id);
  Future<List<FriendRequestEntity>> getSendRequest();
  Future<bool> recallRequest(String id);
  Future<List<FriendRequestEntity>> getReceiveRequest();
  Future<bool> acceptReceiveRequest(String userId);
  Future<bool> rejectReceiveRequest(String userId);
}

@Injectable(as: FriendUseCase)
class FriendUseCaseImpl extends FriendUseCase {
  final FriendRepository repo;

  FriendUseCaseImpl({required this.repo});

  @override
  Future<bool> acceptReceiveRequest(String userId) async {
    return await repo.acceptReceiveRequest(userId);
  }

  @override
  Future<bool> blockFriend(String id) async {
    return await repo.blockFriend(id);
  }

  @override
  Future<bool> deleteFriend(String id) async {
    return await repo.deleteFriend(id);
  }

  @override
  Future<void> getListChatWithFriends() async {
    return await repo.getListChatWithFriends();
  }

  @override
  Future<List<UserEntity>> getListFriend() async {
    return await repo.getListFriend();
  }

  @override
  Future<List<FriendRequestEntity>> getReceiveRequest() async {
    return await repo.getReceiveRequest();
  }

  @override
  Future<List<FriendRequestEntity>> getSendRequest() async {
    return await repo.getSendRequest();
  }

  @override
  Future<bool> recallRequest(String id) async {
    return await repo.recallRequest(id);
  }

  @override
  Future<bool> rejectReceiveRequest(String userId) {
    return repo.rejectReceiveRequest(userId);
  }

  @override
  Future<bool> sendRequest(String id) async {
    return repo.sendRequest(id);
  }

  @override
  Future<bool> unBlockFruiend(String id) {
    return repo.unBlockFruiend(id);
  }
}
