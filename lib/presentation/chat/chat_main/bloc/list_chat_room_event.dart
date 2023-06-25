part of 'list_chat_room_bloc.dart';

@freezed
class ListChatRoomEvent with _$ListChatRoomEvent {
  const factory ListChatRoomEvent.started() = _Started;
  const factory ListChatRoomEvent.refreshed() = ListChatRoomRefreshed;
}
