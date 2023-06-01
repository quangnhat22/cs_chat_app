part of 'list_group_bloc.dart';

@freezed
class ListGroupEvent with _$ListGroupEvent {
  const factory ListGroupEvent.started() = _Started;
  const factory ListGroupEvent.refreshed() = ListGroupRefreshed;
}
