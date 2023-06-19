import 'package:chatapp/domain/entities/device_entity.dart';

abstract class DeviceRepository {
  Future<List<DeviceEntity>> getListDevice();

  Future<bool> updateDevice(String name, String pushNotificationToken);

  Future<bool> deleteDevice(String id);
}
