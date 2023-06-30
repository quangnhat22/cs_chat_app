part of 'list_member_cubit.dart';

@freezed
class ListMemberState with _$ListMemberState {
  const factory ListMemberState.initial({
    List<UserEntity>? listMember,
    List<UserEntity>? listMemberDisplay,
  }) = _Initial;
}
