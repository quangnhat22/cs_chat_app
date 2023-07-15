import 'package:chatapp/data/data_sources/remote/service/group_service.dart';
import 'package:chatapp/data/data_sources/web_socket/new_message_socket.dart';
import 'package:chatapp/data/models/chat_room_model.dart';
import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/entities/latest_message_entity.dart';
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
  final NewMessageSocket _newMessageSocket;

  ChatRoomRepoImpl(this._groupService, this._newMessageSocket);

  @override
  Future<List<ChatRoomEntity>> getListChatRoom(String? query) async {
    try {
      final res = await _groupService.getListGroup(query);
      final listGroupChatRoom = _convertJsonToChatRoomModel(res);

      // listChatRoom.sort((i1, i2) => i1.la)
      return listGroupChatRoom
          .where((chatroom) =>
              chatroom.latestMessageEntity !=
              LatestMessageEntity.latestMessageEmpty)
          .toList();
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

          final format = DateFormat('yyyy-MM-dd HH:mm');

          String dateTimePrev =
              format.format(listMessageModel[0].createdAt!.toUtc());

          final listMessageEntity =
              listMessageModel.mapIndexed((index, messageModel) {
            if (index > 0) {
              dateTimePrev =
                  format.format(listMessageModel[index - 1].createdAt!);
            }

            return MessageEntity.convertToMessageEntity(
                model: messageModel,
                isSameDate: format.format(messageModel.createdAt!.toUtc()) ==
                    dateTimePrev);
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

  @override
  Future<ChatRoomEntity> getChatRoomDetailById(String id) async {
    try {
      final res = await _groupService.getGroupDetailById(id);

      // save to local
      if (res.statusCode == 200) {
        final model = ChatRoomModel.fromJson(res.data["data"]["group_details"]);
        return ChatRoomEntity.convertToChatRoomEntity(chatRoomModel: model);
      }
      return ChatRoomEntity.chatRoomEntityEmpty;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<MessageEntity> getChatRoomUpdated() {
    try {
      return _newMessageSocket.getStream().map(
          (message) => MessageEntity.convertToMessageEntity(model: message));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> connectSocket() async {
    try {
      await _newMessageSocket.connect();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> disconnectSocket() async {
    try {
      await _newMessageSocket.disconnect();
    } catch (e) {
      throw Exception(e);
    }
  }

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
}

extension CheckHHDDMMYYYOnlyCompare on DateTime {
  bool isSameHours(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day &&
        hour == other.hour;
  }
}
