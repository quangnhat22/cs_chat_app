import 'dart:async';

import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/message_entity.dart';

part 'chat_room_bloc.freezed.dart';
part 'chat_room_event.dart';
part 'chat_room_state.dart';

@Injectable()
class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final ChatRoomUseCase _chatRoomUseCase;

  ChatRoomBloc(this._chatRoomUseCase) : super(const ChatRoomState.initial()) {
    on<ChatRoomEvent>((event, emit) async {
      await event.map(
          started: (event) async => await _started(event, emit),
          refreshed: (event) async => await _refreshed(event, emit),
          addMessageTemp: (event) async => _addMessageTemp(event, emit),
          newMessageNotified: (event) async =>
              await _newMessageNotified(event, emit),
          newMessageTopLoaded: (event) async =>
              await _newMessageTopLoaded(event, emit),
          newMessageBottomLoaded: (event) async =>
              await _newMessageBottomLoaded(event, emit));
    });
  }

  bool isGroup = false;
  String? _searchId;

  Future<void> _started(Started event, Emitter<ChatRoomState> emit) async {
    try {
      emit(const ChatRoomInfoInProgress());

      isGroup = (event.type == "personal") ? false : true;

      String? chatRoomName = "";
      String? chatRoomAvatar = "";
      List<MessageEntity> listMessage;

      // if (isGroup) {
      //   //final groupInfo = await _groupUseCase.getListChatWithGroup(groupId: event.id);
      //   //TODO: gán groupInfo
      // } else {
      //   final friendInfo = await _userUseCase.getUserById(event.id);
      //   chatRoomName = friendInfo?.name;
      //   chatRoomAvatar = friendInfo?.avatar;
      // }

      if (event.searchMessage != null) {
        _searchId = event.searchMessage!.id;
        final topListMessage = await _chatRoomUseCase.getListMessage(
          chatRoomId: event.chatRoomId,
          lastId: event.searchMessage!.id,
          order: 'dsc',
          limit: 10,
        );
        final bottomListMessage = await _chatRoomUseCase.getListMessage(
          chatRoomId: event.chatRoomId,
          lastId: event.searchMessage!.id,
          order: 'asc',
          limit: 10,
        );

        listMessage = [
          ...bottomListMessage.reversed,
          event.searchMessage!.copyWith(isResultSearch: true),
          ...topListMessage,
        ];
      } else {
        listMessage =
            await _chatRoomUseCase.getListMessage(chatRoomId: event.chatRoomId);
      }

      emit(ChatRoomInfoSuccess(
        messages: listMessage,
        chatRoomId: event.chatRoomId,
        id: event.id,
        isGroupChatRoom: isGroup,
        chatRoomName: chatRoomName,
        chatRoomAvatar: chatRoomAvatar,
        searchMessageId: event.searchMessage?.id,
      ));
    } catch (e) {
      emit(ChatRoomInfoFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<void> _refreshed(
      ChatRoomRefreshed event, Emitter<ChatRoomState> emit) async {
    try {
      if (state is ChatRoomInfoSuccess) {
        final chatRoomState = state as ChatRoomInfoSuccess;
        final listMessage = await _chatRoomUseCase.getListMessage(
            chatRoomId: chatRoomState.chatRoomId);

        emit(chatRoomState.copyWith(
          messages: listMessage,
          searchMessageId: null,
        ));
      }
    } catch (e) {
      emit(ChatRoomInfoFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }

  void _addMessageTemp(
      ChatRoomAddMessageTemp event, Emitter<ChatRoomState> emit) {
    try {
      if (state is ChatRoomInfoSuccess) {
        add(const ChatRoomRefreshed());
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

      // final isSearching =
      //     (state as ChatRoomInfoSuccess).searchMessageId != null &&
      //         (state as ChatRoomInfoSuccess).isLatestMessage == false;

      // if (isSearching)

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

        if (listMessageCurrent.length < 10) return;

        final loadedMessages = await _chatRoomUseCase.getListMessage(
          chatRoomId: chatRoomId,
          lastId: listMessageCurrent.last.id,
        );

        bool isTop = false;

        if (loadedMessages.isEmpty) {
          isTop = true;
        }

        final List<MessageEntity> newListMessage = List.from(listMessageCurrent)
          ..addAll(loadedMessages);
        emit((state as ChatRoomInfoSuccess).copyWith(
          messages: newListMessage,
          isTopMessage: isTop,
        ));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _newMessageBottomLoaded(
      ChatRoomNewMessageBottomLoaded event, Emitter<ChatRoomState> emit) async {
    try {
      if (_searchId == null) return;

      if (state is ChatRoomInfoSuccess) {
        if ((state as ChatRoomInfoSuccess).isLatestMessage) return;
        final chatRoomId = (state as ChatRoomInfoSuccess).chatRoomId;

        final listMessageCurrent = (state as ChatRoomInfoSuccess).messages;

        final loadedMessages = await _chatRoomUseCase.getListMessage(
          chatRoomId: chatRoomId,
          lastId: listMessageCurrent.first.id,
          order: 'asc',
          limit: 5,
        );

        List<MessageEntity> newListMessage = List.from(listMessageCurrent);
        newListMessage = [...loadedMessages.reversed, ...newListMessage];
        emit((state as ChatRoomInfoSuccess).copyWith(
          messages: newListMessage,
          isLatestMessage: (loadedMessages.length < 5),
        ));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
