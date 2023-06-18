import 'dart:async';

import 'package:chatapp/domain/modules/friend/friend_usecase.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
  bool isGroup = false;

  Future<void> _started(Started event, Emitter<ChatRoomState> emit) async {
    try {
      emit(const ChatRoomInfoInProgress());

      isGroup = (event.type == "friend") ? false : true;

      String? chatRoomName = "";
      String? chatRoomAvatar = "";
      List<MessageEntity> listMessage;

      if (isGroup) {
        //final groupInfo = await _groupUseCase.getListChatWithGroup(groupId: event.id);
        //TODO: gán groupInfo
        listMessage =
            await _groupUseCase.getListChatWithGroup(groupId: event.id);
      } else {
        final friendInfo = await _userUseCase.getUserById(event.id);
        chatRoomName = friendInfo?.name;
        chatRoomAvatar = friendInfo?.avatar;
        listMessage =
            await _friendUseCase.getListChatWithFriends(userId: event.id);
      }

      emit(ChatRoomInfoSuccess(
        messages: listMessage,
        chatRoomId: event.id,
        isGroupChatRoom: isGroup,
        chatRoomName: chatRoomName,
        chatRoomAvatar: chatRoomAvatar,
      ));
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
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _newMessageTopLoaded(
      ChatRoomNewMessageTopLoaded event, Emitter<ChatRoomState> emit) async {
    try {
      if (state is ChatRoomInfoSuccess) {
        final chatRoomId = (state as ChatRoomInfoSuccess).chatRoomId;
        final listMessageCurrent = (state as ChatRoomInfoSuccess).messages;

        final loadedMessages = await _friendUseCase.getListChatWithFriends(
            userId: chatRoomId, latestMessageId: listMessageCurrent.last.id);

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
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
