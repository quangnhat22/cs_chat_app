part of 'list_group_request_bloc.dart';

@freezed
class ListGroupRequestState with _$ListGroupRequestState {
  const factory ListGroupRequestState.initial() = _Initial;

  const factory ListGroupRequestState.getDataInProgress() =
      GetListGroupRequestInProgress;
}
