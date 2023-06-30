part of 'invite_new_member_cubit.dart';

enum InviteNewMemberStatus { initial, inProgress, success, fail }

enum GetFriendsStatus { initial, inProgress, success, fail }

@freezed
class InviteNewMemberState with _$InviteNewMemberState {
  const factory InviteNewMemberState.initial({
    List<UserEntity>? listMembers,
    List<UserEntity>? displayMembers,
    @Default(GetFriendsStatus.initial) getFriendsStatus,
    @Default(InviteNewMemberStatus.initial) status,
  }) = _Initial;
}
