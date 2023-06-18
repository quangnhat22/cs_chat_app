part of 'chat_room_bloc.dart';

@freezed
class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState.initial() = _Initial;

  const factory ChatRoomState.getChatRoomInfoInProgress() =
      ChatRoomInfoInProgress;

  const factory ChatRoomState.getChatRoomInfoSuccess({
    required List<MessageEntity> messages,
    required UserEntity user,
    @Default(false) bool isLatest,
  }) = ChatRoomInfoSuccess;

  const factory ChatRoomState.getGroupChatRoomInfoSuccess({
    required List<MessageEntity> messages,
    required GroupEntity groupInfo,
    @Default(false) bool isLatest,
  }) = GroupChatRoomInfoSuccess;

  const factory ChatRoomState.getChatRoomInfoFailure({
    required String message,
  }) = ChatRoomInfoFailure;
}
