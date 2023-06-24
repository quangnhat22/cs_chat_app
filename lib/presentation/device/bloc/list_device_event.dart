part of 'list_device_bloc.dart';

@freezed
class ListDeviceEvent with _$ListDeviceEvent {
  const factory ListDeviceEvent.started() = _Started;
  const factory ListDeviceEvent.refreshed() = ListDeviceRefreshed;
}
