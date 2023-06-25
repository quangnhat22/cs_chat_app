part of 'list_chat_room_bloc.dart';

@freezed
class ListChatRoomState with _$ListChatRoomState {
  const factory ListChatRoomState.initial() = _Initial;

  const factory ListChatRoomState.getListChatRoomInProgress() =
      GetListChatRoomInProgress;

  const factory ListChatRoomState.getListChatRoomInSuccess({
    required List<ChatRoomEntity> listChatRoom,
  }) = GetListChatRoomInSucess;

  const factory ListChatRoomState.getListChatRoomInFailure({
    String? message,
  }) = GetListChatRoomInFailure;
}
