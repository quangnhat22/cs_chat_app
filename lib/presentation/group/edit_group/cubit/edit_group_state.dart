part of 'edit_group_cubit.dart';

enum EditGroupSubmitStatus { initial, success, fail, inProgress }

@freezed
class EditGroupState with _$EditGroupState {
  const factory EditGroupState.initial({
    String? groupId,
    String? groupName,
    String? groupAvatar,
    @Default(false) bool isChangeImage,
    @Default(EditGroupSubmitStatus.initial) EditGroupSubmitStatus status,
  }) = _Initial;
}
