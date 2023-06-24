import 'package:chatapp/data/data_sources/remote/service/friend_service.dart';
import 'package:chatapp/data/data_sources/remote/service/group_service.dart';
import 'package:chatapp/data/models/chat_room_model.dart';
import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/chat_room/chat_room_repository.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../models/message_model.dart';

@Injectable(as: ChatRoomRepository)
class ChatRoomRepoImpl extends ChatRoomRepository {
  final GroupService _groupService;
  final FriendService _personalService;

  ChatRoomRepoImpl(this._groupService, this._personalService);

  List<ChatRoomEntity> _convertJsonToChatRoomModel(Response<dynamic> res) {
    try {
      if (res.statusCode == 200) {
        final listChatRoomJson = res.data["data"] as List<dynamic>?;
        if (listChatRoomJson == null) return [];

        final listChatRoomModel = listChatRoomJson
            .map((friendJson) => ChatRoomModel.fromJson(friendJson))
            .toList();

        final listChatRoomEntity = listChatRoomModel
            .map((chatRooModel) => ChatRoomEntity.convertToChatRoomEntity(
                chatRoomModel: chatRooModel))
            .toList();

        return listChatRoomEntity;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ChatRoomEntity>> getListChatRoom(String query) async {
    try {
      List<ChatRoomEntity> listChatRoom = [];
      if (query == "all" || query == "personal") {
        final res = await _personalService.findFriend();
        final listPersonalChatRoom = _convertJsonToChatRoomModel(res);
        listChatRoom = [...listChatRoom, ...listPersonalChatRoom];
      }
      if (query == "all" || query == "group") {
        final res = await _groupService.getListGroup();
        final listGroupChatRoom = _convertJsonToChatRoomModel(res);
        listChatRoom = [...listChatRoom, ...listGroupChatRoom];
      }

      // listChatRoom.sort((i1, i2) => i1.la)
      return listChatRoom;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MessageEntity>> getListMessage({
    required String chatRoomId,
    required int limit,
    required order,
    String? lastId,
    String? type,
  }) async {
    try {
      final res = await _groupService.getListMessage(
        id: chatRoomId,
        limit: limit,
        order: order,
        type: type,
        latestMessageId: lastId,
      );

      if (res.statusCode == 200) {
        final listMessageJson = res.data["data"] as List<dynamic>?;

        if (listMessageJson != null) {
          final listMessageModel = listMessageJson
              .map((messageJson) => MessageModel.fromJson(messageJson))
              .toList();

          String? dateTimePrev;

          final format = DateFormat('yyyy-MM-dd');

          final listMessageEntity =
              listMessageModel.mapIndexed((index, messageModel) {
            if (index == 0) {
              dateTimePrev = format.format(messageModel.createdAt!);
            }

            return MessageEntity.convertToMessageEntity(
                model: messageModel,
                isSameDate:
                    format.format(messageModel.createdAt!) == dateTimePrev);
          }).toList();

          return (order == "dsc")
              ? listMessageEntity.reversed.toList()
              : listMessageEntity;
        }
      }
      return List<MessageEntity>.empty();
    } catch (e) {
      throw Exception(e);
    }
  }
}
