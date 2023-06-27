part of 'group_details_bloc.dart';

@freezed
class GroupDetailsState with _$GroupDetailsState {
  const factory GroupDetailsState.initial() = _Initial;
  const factory GroupDetailsState.inProgress() = GetGroupDetailsInProgress;
  const factory GroupDetailsState.inSuccess({
    required ChatRoomEntity groupInfo,
  }) = GetGroupDetailsInSuccess;
  const factory GroupDetailsState.inFailed({String? message}) =
      GetGroupDetailsInFailed;
  const factory GroupDetailsState.leaveGroupSuccess() =
      LeaveGroupDetailsInSuccess;
  const factory GroupDetailsState.leaveGroupFail() = LeaveGroupDetailsInFailed;
}
