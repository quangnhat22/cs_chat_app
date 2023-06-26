part of 'friend_detail_cubit.dart';

@freezed
class FriendDetailState with _$FriendDetailState {
  const factory FriendDetailState.initial({
    ChatRoomEntity? chatRoomDetail,
    String? chatRoomId,
    String? id,
  }) = _Initial;
}
