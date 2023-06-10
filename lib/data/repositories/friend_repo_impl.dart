import 'package:chatapp/data/data_sources/remote/service/friend_service.dart';
import 'package:chatapp/data/models/friend_request_model.dart';
import 'package:chatapp/data/models/message_model.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:chatapp/domain/entities/friend_request_entity.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/friend/friend_repository.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FriendRepository)
class FriendRepositoryImpl extends FriendRepository {
  FriendRepositoryImpl({required FriendService service}) : _service = service;

  final FriendService _service;

  @override
  Future<bool> acceptReceiveRequest(String userId) async {
    try {
      final res = await _service.acceptReceiveRequest(userId);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> blockFriend(String id) async {
    try {
      final res = await _service.blockFriend(id);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> deleteFriend(String id) async {
    try {
      final res = await _service.deleteFriend(id);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<List<MessageEntity>> getListChatWithFriends({
    required String userId,
    String? latestMessageId,
    int? limit,
  }) async {
    try {
      final res = await _service.getListChat(
        userId: userId,
        latestMessageId: latestMessageId,
        limit: limit,
      );
      if (res.statusCode == 200) {
        final listMessageJson = res.data["data"] as List<dynamic>?;
        if (listMessageJson != null) {
          final listMessageModel = listMessageJson
              .map((messageJson) => MessageModel.fromJson(messageJson))
              .toList();

          DateTime? dateTimePrev;
          final listMessageEntity =
              listMessageModel.mapIndexed((index, messageModel) {
            if (index == 0) dateTimePrev = messageModel.createdAt;

            return MessageEntity.convertToMessageEntity(
                model: messageModel,
                isSameDate: messageModel.createdAt == dateTimePrev);
          }).toList();

          return listMessageEntity;
        }
      }
      return List<MessageEntity>.empty();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<UserEntity>> getListFriend() async {
    try {
      final res = await _service.findFriend();
      if (res.statusCode == 200) {
        final listFriendJson = res.data["data"] as List<dynamic>?;

        if (listFriendJson != null) {
          final friendModels = listFriendJson
              .map((friendJson) => UserModel.fromJson(friendJson))
              .toList();

          final friendEntities = friendModels
              .map((friendModel) =>
                  UserEntity.convertToUserEntity(userModel: friendModel))
              .toList();

          return friendEntities;
        }
      }
      return List<UserEntity>.empty();
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<List<FriendRequestEntity>> getReceiveRequest() async {
    try {
      final res = await _service.getReceiveRequest();
      if (res.statusCode == 200) {
        final listReceiveJson = res.data["data"] as List<dynamic>?;
        if (listReceiveJson != null) {
          final receiveModels = listReceiveJson
              .map((receiveJson) => FriendRequestModel.fromJson(receiveJson))
              .toList();

          final receiveEntities = receiveModels
              .map((receiveEntity) =>
                  FriendRequestEntity.convertToFriendRequestEntity(
                      model: receiveEntity))
              .toList();
          return receiveEntities;
        }
      }
      return List<FriendRequestEntity>.empty();
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<List<FriendRequestEntity>> getSendRequest() async {
    try {
      final res = await _service.getSendRequest();
      if (res.statusCode == 200) {
        final listSendJson = res.data["data"] as List<dynamic>?;

        if (listSendJson != null) {
          final sendModels = listSendJson
              .map((sendModel) => FriendRequestModel.fromJson(sendModel))
              .toList();

          final sendEntities = sendModels
              .map((sendEntity) =>
                  FriendRequestEntity.convertToFriendRequestEntity(
                      model: sendEntity))
              .toList();

          return sendEntities;
        }
      }
      return List<FriendRequestEntity>.empty();
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> recallRequest(String id) async {
    try {
      final res = await _service.recallRequest(id);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> rejectReceiveRequest(String userId) async {
    try {
      final res = await _service.rejectReceiveRequest(userId);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> sendRequest(String id) async {
    try {
      final res = await _service.sendRequest(id);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> unBlockFriend(String id) async {
    try {
      final res = await _service.unBlockFriend(id);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }
}
