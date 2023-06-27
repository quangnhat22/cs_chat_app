part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial({
    List<UserEntity>? friends,
    List<ChatRoomEntity>? groups,
    List<ChatRoomEntity>? messages,
  }) = _Initial;
}
