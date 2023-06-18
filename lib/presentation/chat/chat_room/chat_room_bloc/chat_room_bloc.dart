import 'dart:async';

import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/friend/friend_usecase.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/group_entity.dart';
import '../../../../domain/entities/message_entity.dart';

part 'chat_room_bloc.freezed.dart';
part 'chat_room_event.dart';
part 'chat_room_state.dart';

@Injectable()
class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc({
    required UserUseCase userUC,
    required FriendUseCase friendUC,
    required GroupUseCase groupUC,
  })  : _userUseCase = userUC,
        _friendUseCase = friendUC,
        _groupUseCase = groupUC,
        super(const ChatRoomState.initial()) {
    on<ChatRoomEvent>((event, emit) async {
      await event.map(
          started: (event) async => _started(event, emit),
          refreshed: (event) async => _refreshed(event, emit),
          addMessageTemp: (event) async => _addMessageTemp(event, emit),
          newMessageNotified: (event) async => _newMessageNotified(event, emit),
          newMessageTopLoaded: (event) async =>
              _newMessageTopLoaded(event, emit));
    });
  }

  final FriendUseCase _friendUseCase;
  final UserUseCase _userUseCase;
  final GroupUseCase _groupUseCase;
  final bool isGroup = false;

  Future<void> _started(Started event, Emitter<ChatRoomState> emit) async {
    try {
      emit(const ChatRoomInfoInProgress());

      if (event.type == "friend") {
        final friendInfo = await _userUseCase.getUserById(event.id);

        final listMessage =
            await _friendUseCase.getListChatWithFriends(userId: event.id);

        if (friendInfo != null) {
          emit(ChatRoomInfoSuccess(messages: listMessage, user: friendInfo));
        } else {
          emit(const ChatRoomInfoFailure(
              message: "Can't not get data! Try again"));
        }
      } else {
        //final groupInfo = await _groupUseCase.getListChatWithGroup(groupId: event.id);

        final listMessage =
            await _groupUseCase.getListChatWithGroup(groupId: event.id);

        //if (groupInfo != null) {
        emit(GroupChatRoomInfoSuccess(
            groupInfo: GroupEntity.groupEntityEmpty, messages: listMessage));
        // } else {
        //   emit(const ChatRoomInfoFailure(
        //       message: "Can't not get data! Try again"));
        // }
      }
    } catch (e) {
      emit(ChatRoomInfoFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<void> _refreshed(
      ChatRoomRefreshed event, Emitter<ChatRoomState> emit) async {}

  void _addMessageTemp(
      ChatRoomAddMessageTemp event, Emitter<ChatRoomState> emit) {
    try {
      if (state is ChatRoomInfoSuccess) {
        List<MessageEntity> listMessageCurrent =
            (state as ChatRoomInfoSuccess).messages;

        listMessageCurrent = [event.newMessage, ...listMessageCurrent];

        emit((state as ChatRoomInfoSuccess)
            .copyWith(messages: listMessageCurrent));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _newMessageNotified(
      ChatRoomNewMessageNotified event, Emitter<ChatRoomState> emit) async {
    try {
      if (state is ChatRoomInfoSuccess) {
        List<MessageEntity> listMessageCurrent =
            (state as ChatRoomInfoSuccess).messages;

        //remove message temp
        if (event.newMessage.optional != null) {
          final indexAvailable = listMessageCurrent
              .indexWhere((message) => message.id == event.newMessage.optional);
          if (indexAvailable != -1) {
            List<MessageEntity> newMessage = List.from(listMessageCurrent);
            newMessage = newMessage..removeAt(indexAvailable);
            listMessageCurrent = [...newMessage];
          }
        }

        listMessageCurrent = [event.newMessage, ...listMessageCurrent];

        emit((state as ChatRoomInfoSuccess)
            .copyWith(messages: listMessageCurrent));
      }
      if (state is GroupChatRoomInfoSuccess) {
        List<MessageEntity> listMessageCurrent =
            (state as GroupChatRoomInfoSuccess).messages;

        //remove message temp
        if (event.newMessage.optional != null) {
          final indexAvailable = listMessageCurrent
              .indexWhere((message) => message.id == event.newMessage.optional);
          if (indexAvailable != -1) {
            List<MessageEntity> newMessage = List.from(listMessageCurrent);
            newMessage = newMessage..removeAt(indexAvailable);
            listMessageCurrent = [...newMessage];
          }
        }

        listMessageCurrent = [event.newMessage, ...listMessageCurrent];

        emit((state as GroupChatRoomInfoSuccess)
            .copyWith(messages: listMessageCurrent));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _newMessageTopLoaded(
      ChatRoomNewMessageTopLoaded event, Emitter<ChatRoomState> emit) async {
    try {
      if (state is ChatRoomInfoSuccess) {
        final userId = (state as ChatRoomInfoSuccess).user.id;
        final listMessageCurrent = (state as ChatRoomInfoSuccess).messages;

        final loadedMessages = await _friendUseCase.getListChatWithFriends(
            userId: userId, latestMessageId: listMessageCurrent.last.id);

        bool isLatest = false;

        if (loadedMessages.isEmpty) {
          isLatest = true;
        }

        final List<MessageEntity> newListMessage = List.from(listMessageCurrent)
          ..addAll(loadedMessages);
        emit((state as ChatRoomInfoSuccess).copyWith(
          messages: newListMessage,
          isLatest: isLatest,
        ));
      } else if (state is GroupChatRoomInfoSuccess) {
        //final groupId = (state as GroupChatRoomInfoSuccess).groupInfo.id;
        final groupId = "648e6a2ad3f1d82db85072f2";
        final listMessageCurrent = (state as GroupChatRoomInfoSuccess).messages;

        final loadedMessages = await _groupUseCase.getListChatWithGroup(
            groupId: groupId, latestMessageId: listMessageCurrent.last.id);

        bool isLatest = false;

        if (loadedMessages.isEmpty) {
          isLatest = true;
        }

        final List<MessageEntity> newListMessage = List.from(listMessageCurrent)
          ..addAll(loadedMessages);
        emit((state as GroupChatRoomInfoSuccess).copyWith(
          messages: newListMessage,
          isLatest: isLatest,
        ));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
