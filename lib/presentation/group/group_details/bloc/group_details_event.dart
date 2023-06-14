part of 'group_details_bloc.dart';

@freezed
class GroupDetailsEvent with _$GroupDetailsEvent {
  const factory GroupDetailsEvent.started() = _Started;
  const factory GroupDetailsEvent.refreshed() = GroupDetailsRefreshed;
}
