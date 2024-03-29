part of 'chat_room_bloc.dart';

@freezed
class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.started({
    required String type,
    required String id,
    required String chatRoomId,
    String? latestMessageId,
    MessageEntity? searchMessage,
  }) = Started;

  const factory ChatRoomEvent.refreshed() = ChatRoomRefreshed;

  const factory ChatRoomEvent.updateChatRoom() = ChatRoomUpdated;

  const factory ChatRoomEvent.addMessageTemp({
    required MessageEntity newMessage,
  }) = ChatRoomAddMessageTemp;

  const factory ChatRoomEvent.newMessageNotified({
    required MessageEntity newMessage,
    required String typeChatRoom,
  }) = ChatRoomNewMessageNotified;

  const factory ChatRoomEvent.newMessageTopLoaded() =
      ChatRoomNewMessageTopLoaded;
  const factory ChatRoomEvent.newMessageBottomLoaded() =
      ChatRoomNewMessageBottomLoaded;
}
