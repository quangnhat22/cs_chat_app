part of 'group_details_bloc.dart';

@freezed
class GroupDetailsState with _$GroupDetailsState {
  const factory GroupDetailsState.initial() = _Initial;
  const factory GroupDetailsState.inProgress() = GetGroupDetailsInProgress;
  const factory GroupDetailsState.inSuccess({
    required List<GroupEntity> groupDetails,
  }) = GetGroupDetailsInSuccess;
  const factory GroupDetailsState.inFailed({String? message}) =
      GetGroupDetailsInFailed;
}
