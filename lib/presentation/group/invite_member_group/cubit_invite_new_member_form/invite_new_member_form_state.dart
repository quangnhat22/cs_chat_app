part of 'invite_new_member_form_cubit.dart';

@freezed
class InviteNewMemberFormState with _$InviteNewMemberFormState {
  const factory InviteNewMemberFormState.initial({
    @Default([]) List<UserEntity> newMember,
  }) = _Initial;
}
