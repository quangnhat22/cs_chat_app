part of 'list_chat_room_bloc.dart';

@freezed
class ListChatRoomEvent with _$ListChatRoomEvent {
  const factory ListChatRoomEvent.inited() = ListChatRoomPageInited;
  const factory ListChatRoomEvent.started() = ListChatRoomPageStarted;
  const factory ListChatRoomEvent.refreshed() = ListChatRoomRefreshed;
  const factory ListChatRoomEvent.listChatRoomUpdated(
      {required MessageEntity newMessage}) = ListChatRoomUpdated;
}
