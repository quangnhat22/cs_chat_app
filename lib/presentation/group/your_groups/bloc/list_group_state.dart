part of 'list_group_bloc.dart';

@freezed
class ListGroupState with _$ListGroupState {
  const factory ListGroupState.initial() = _Initial;
  const factory ListGroupState.inProgress() = GetListGroupInProgress;
  const factory ListGroupState.inSuccess({
    required List<GroupEntity> listGroup,
  }) = GetListGroupInSuccess;
  const factory ListGroupState.inFailed({String? message}) =
      GetListGroupInFailed;
}
