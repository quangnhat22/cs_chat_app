import 'package:chatapp/data/models/device_model.dart';

class DeviceEntity {
  final String id;
  final String? name;
  final String? pushNotificationToken;

  DeviceEntity({required this.id, this.name, this.pushNotificationToken});

  static final deviceEntityEmpty = DeviceEntity(id: "-1");

  static DeviceEntity convertToDeviceEntity({
    DeviceModel? deviceModel,
  }) {
    if (deviceModel == null) return deviceEntityEmpty;
    return DeviceEntity(
        id: deviceModel.id,
        name: deviceModel.name,
        pushNotificationToken: deviceModel.pushNotificationToken);
  }
}
