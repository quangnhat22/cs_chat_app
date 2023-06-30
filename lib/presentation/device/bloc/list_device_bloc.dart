import 'package:chatapp/domain/modules/device/device_usecase.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/device_entity.dart';

part 'list_device_event.dart';
part 'list_device_state.dart';
part 'list_device_bloc.freezed.dart';

@Injectable()
class ListDeviceBloc extends Bloc<ListDeviceEvent, ListDeviceState> {
  ListDeviceBloc({required DeviceUseCase deviceUC})
      : _deviceUC = deviceUC,
        super(const _Initial()) {
    on<ListDeviceEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        refreshed: (event) => _refresh(event, emit),
      );
    });
  }

  final DeviceUseCase _deviceUC;

  Future<void> _started(_Started event, Emitter<ListDeviceState> emit) async {
    try {
      emit(const GetListDeviceInProgress());
      final listDevice = await _deviceUC.getListDevice();
      emit(GetListDeviceInSuccess(listDevice: listDevice));
    } catch (e) {
      emit(GetListDeviceInFailed(message: e.toString()));
    }
  }

  Future<void> _refresh(
      ListDeviceRefreshed event, Emitter<ListDeviceState> emit) async {
    try {
      List<DeviceEntity> listDevice = await _deviceUC.getListDevice();
      listDevice.sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
      emit(
        GetListDeviceInSuccess(
          listDevice: listDevice,
        ),
      );
    } catch (e) {
      emit(GetListDeviceInFailed(message: e.toString()));
    }
  }
}
