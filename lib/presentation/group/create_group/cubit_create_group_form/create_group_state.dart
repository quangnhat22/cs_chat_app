part of 'create_group_cubit.dart';

@freezed
class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState.initial({
    @Default("") String groupName,
    String? groupImage,
    @Default([]) List<UserEntity?> members,
  }) = _Initial;
}
