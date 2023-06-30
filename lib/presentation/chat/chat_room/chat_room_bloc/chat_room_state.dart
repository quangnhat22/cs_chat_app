part of 'chat_room_bloc.dart';

@freezed
class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState.initial() = _Initial;

  const factory ChatRoomState.getChatRoomInfoInProgress() =
      ChatRoomInfoInProgress;

  const factory ChatRoomState.getChatRoomInfoSuccess({
    required List<MessageEntity> messages,
    required String id,
    required String chatRoomId,
    String? searchMessageId,
    @Default(false) bool isGroupChatRoom,
    String? chatRoomName, //case: chat with friend
    String? chatRoomAvatar, // case: chat with group
    @Default(false) bool isTopMessage,
    @Default(false) bool isLatestMessage,
  }) = ChatRoomInfoSuccess;

  const factory ChatRoomState.getChatRoomInfoFailure({
    required String message,
  }) = ChatRoomInfoFailure;
}
