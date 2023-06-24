import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/friend/friend_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/friend_request_entity.dart';

abstract class FriendUseCase {
  Future<bool> sendRequest(String id);

  Future<List<MessageEntity>> getListChatWithFriends({
    required String userId,
    String? latestMessageId,
    int? limit,
  });

  // Future<List<ChatRoomEntity>> getListFriend();

  Future<bool> deleteFriend(String id);

  Future<bool> blockFriend(String id);

  Future<bool> unBlockFriend(String id);

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
  Future<List<MessageEntity>> getListChatWithFriends({
    required String userId,
    String? latestMessageId,
    int? limit,
  }) async {
    return await repo.getListChatWithFriends(
        userId: userId, latestMessageId: latestMessageId, limit: limit);
  }

  // @override
  // Future<List<ChatRoomEntity>> getListFriend() async {
  //   return await repo.getListFriend();
  // }

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
  Future<bool> unBlockFriend(String id) {
    return repo.unBlockFriend(id);
  }
}
