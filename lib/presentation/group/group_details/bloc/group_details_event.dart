part of 'group_details_bloc.dart';

@freezed
class GroupDetailsEvent with _$GroupDetailsEvent {
  const factory GroupDetailsEvent.started({required String id}) = _Started;
  const factory GroupDetailsEvent.refreshed() = GroupDetailsRefreshed;
  const factory GroupDetailsEvent.leaved({required String id}) =
      GroupDetailsLeaved;
}
