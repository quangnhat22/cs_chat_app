import 'package:chatapp/domain/entities/device_entity.dart';
import 'package:chatapp/domain/modules/device/device_repository.dart';
import 'package:injectable/injectable.dart';

abstract class DeviceUseCase {
  Future<List<DeviceEntity>> getListDevice();

  Future<bool> updateDevice(String name, String pushNotificationToken);

  Future<bool> deleteDevice(String id);
}

@Injectable(as: DeviceUseCase)
class DeviceUseCaseImpl extends DeviceUseCase {
  final DeviceRepository _repo;

  DeviceUseCaseImpl({required DeviceRepository deviceRepo})
      : _repo = deviceRepo;

  @override
  Future<List<DeviceEntity>> getListDevice() {
    return _repo.getListDevice();
  }

  @override
  Future<bool> updateDevice(String name, String pushNotificationToken) {
    return _repo.updateDevice(name, pushNotificationToken);
  }

  @override
  Future<bool> deleteDevice(String id) {
    return _repo.deleteDevice(id);
  }
}
