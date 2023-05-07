import 'dart:async';

import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/friend/friend_usecase.dart';
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
  })  : _userUseCase = userUC,
        _friendUseCase = friendUC,
        super(const ChatRoomState.initial()) {
    on<ChatRoomEvent>((event, emit) async {
      await event.map(
          started: (event) async => _started(event, emit),
          refreshed: (event) async => _refreshed(event, emit),
          newMessageNotified: (event) async => _newMessageNotified(event, emit),
          newMessageTopLoaded: (event) async =>
              _newMessageTopLoaded(event, emit));
    });
  }

  final FriendUseCase _friendUseCase;
  final UserUseCase _userUseCase;

  Future<void> _started(Started event, Emitter<ChatRoomState> emit) async {
    try {
      emit(const ChatRoomInfoInProgress());

      final friendInfo = await _userUseCase.getUserById(event.id);
      final listMessage =
          await _friendUseCase.getListChatWithFriends(userId: event.id);

      if (friendInfo != null) {
        emit(ChatRoomInfoSuccess(messages: listMessage, user: friendInfo));
      } else {
        emit(const ChatRoomInfoFailure(
            message: "Can't not get data! Try again"));
      }
    } catch (e) {
      emit(ChatRoomInfoFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<void> _refreshed(
      ChatRoomRefreshed event, Emitter<ChatRoomState> emit) async {}

  Future<void> _newMessageNotified(
      ChatRoomNewMessageNotified event, Emitter<ChatRoomState> emit) async {
    if (state is ChatRoomInfoSuccess) {
      List<MessageEntity> listMessageCurrent =
          (state as ChatRoomInfoSuccess).messages;

      listMessageCurrent = [event.newMessage, ...listMessageCurrent];
      emit((state as ChatRoomInfoSuccess)
          .copyWith(messages: listMessageCurrent));
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
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
