part of 'chat_room_bloc.dart';

@freezed
class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.started({
    required String id,
  }) = Started;

  const factory ChatRoomEvent.refreshed() = ChatRoomRefreshed;

  const factory ChatRoomEvent.addMessageTemp({
    required MessageEntity newMessage,
  }) = ChatRoomAddMessageTemp;

  const factory ChatRoomEvent.newMessageNotified({
    required MessageEntity newMessage,
  }) = ChatRoomNewMessageNotified;

  const factory ChatRoomEvent.newMessageTopLoaded() =
      ChatRoomNewMessageTopLoaded;
}
