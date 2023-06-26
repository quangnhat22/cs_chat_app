import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:chatapp/domain/entities/latest_message_entity.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/chat_room_entity.dart';

part 'list_chat_room_event.dart';
part 'list_chat_room_state.dart';
part 'list_chat_room_bloc.freezed.dart';

@Injectable()
class ListChatRoomBloc extends Bloc<ListChatRoomEvent, ListChatRoomState> {
  final ChatRoomUseCase _chatRoomUseCase;

  ListChatRoomBloc(this._chatRoomUseCase) : super(const _Initial()) {
    on<ListChatRoomEvent>((event, emit) async {
      await event.map(
        inited: (event) async => await _inited(event, emit),
        started: (event) async => await _started(event, emit),
        refreshed: (event) async => await _refresh(event, emit),
        listChatRoomUpdated: (event) async =>
            await _listChatRoomUpdated(event, emit),
      );
    });

    _streamChatRoomChanged = _chatRoomUseCase.getChatRoomUpdated().listen(
      (message) {
        if (message != MessageEntity.messageEntityEmpty) {
          add(ListChatRoomUpdated(newMessage: message));
        }
      },
    );
  }

  late final StreamSubscription<MessageEntity> _streamChatRoomChanged;

  Future<void> _started(
      ListChatRoomPageStarted event, Emitter<ListChatRoomState> emit) async {
    try {
      emit(const GetListChatRoomInProgress());
      final listChatRoom = await _chatRoomUseCase.getListChatRoom(null);
      emit(GetListChatRoomInSucess(listChatRoom: listChatRoom));
    } catch (e) {
      emit(GetListChatRoomInFailure(message: e.toString()));
    }
  }

  Future<void> _refresh(
      ListChatRoomRefreshed event, Emitter<ListChatRoomState> emit) async {
    try {
      final listChatRoom = await _chatRoomUseCase.getListChatRoom(null);
      emit(GetListChatRoomInSucess(listChatRoom: listChatRoom));
    } catch (e) {
      emit(GetListChatRoomInFailure(message: e.toString()));
    }
  }

  Future<void> _listChatRoomUpdated(
      ListChatRoomUpdated event, Emitter<ListChatRoomState> emit) async {
    if (state is GetListChatRoomInSucess) {
      List<ChatRoomEntity> listCurrentChatRoom =
          (state as GetListChatRoomInSucess).listChatRoom;

      ChatRoomEntity chatRoomUpdating = listCurrentChatRoom.firstWhere(
          (chatRoom) => chatRoom.id == event.newMessage.groupEntity!.id,
          orElse: () => ChatRoomEntity.chatRoomEntityEmpty);

      if (chatRoomUpdating != ChatRoomEntity.chatRoomEntityEmpty) {
        listCurrentChatRoom = listCurrentChatRoom
            .where((chatRoom) => chatRoom.id != chatRoomUpdating.id)
            .toList();
      }

      //create new chat room entity

      final latestMessage = LatestMessageEntity(
          message: event.newMessage.message,
          senderId: event.newMessage.sender?.id,
          senderName: event.newMessage.sender?.name,
          createdAt: event.newMessage.createdAt);

      final newChatRoom = ChatRoomEntity(
        id: event.newMessage.groupEntity!.id,
        name: event.newMessage.groupEntity!.name,
        avatar: event.newMessage.groupEntity!.imageUrl,
        latestMessageEntity: latestMessage,
        type: event.newMessage.groupEntity!.type,
      );

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 199,
          channelKey: 'local_chatroom_new_message_channel',
          title: 'Simple Notification',
          body: 'Simple body',
          actionType: ActionType.KeepOnTop,
        ),
      );
      listCurrentChatRoom = [newChatRoom, ...listCurrentChatRoom];

      emit(GetListChatRoomInSucess(listChatRoom: listCurrentChatRoom));
    }
  }

  @override
  Future<void> close() async {
    await _streamChatRoomChanged.cancel();
    await _chatRoomUseCase.disconnectSocket();
    return super.close();
  }

  Future<void> _inited(
      ListChatRoomPageInited event, Emitter<ListChatRoomState> emit) async {
    await _chatRoomUseCase.connectSocket();
  }
}
