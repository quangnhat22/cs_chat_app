part of 'list_device_bloc.dart';

@freezed
class ListDeviceState with _$ListDeviceState {
  const factory ListDeviceState.initial() = _Initial;
  const factory ListDeviceState.inProgress() = GetListDeviceInProgress;
  const factory ListDeviceState.inSuccess({
    required List<DeviceEntity> listDevice,
  }) = GetListDeviceInSuccess;
  const factory ListDeviceState.inFailed({String? message}) =
      GetListDeviceInFailed;
}
