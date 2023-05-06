import 'package:chatapp/domain/entities/friend_request_entity.dart';
import 'package:chatapp/domain/entities/user_entity.dart';

import '../../entities/message_entity.dart';

abstract class FriendRepository {
  Future<bool> sendRequest(String id);
  Future<List<MessageEntity>> getListChatWithFriends(String userId);
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
