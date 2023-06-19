import 'package:chatapp/data/data_sources/remote/service/device_service.dart';
import 'package:chatapp/data/models/device_model.dart';
import 'package:chatapp/domain/entities/device_entity.dart';
import 'package:chatapp/domain/modules/device/device_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeviceRepository)
class DeviceRepoImpl extends DeviceRepository {
  final DeviceService _deviceService;

  DeviceRepoImpl({
    required DeviceService deviceService,
  }) : _deviceService = deviceService;

  @override
  Future<List<DeviceEntity>> getListDevice() async {
    try {
      final res = await _deviceService.getListDevice();
      if (res.statusCode == 200) {
        final listDeviceJson = res.data["data"] as List<dynamic>?;
        if (listDeviceJson != null) {
          final listDeviceModel = listDeviceJson
              .map((deviceJson) => DeviceModel.fromJson(deviceJson))
              .toList();

          final listDeviceEntity = listDeviceModel
              .map((deviceModel) =>
                  DeviceEntity.convertToDeviceEntity(deviceModel: deviceModel))
              .toList();

          return listDeviceEntity;
        }
      }

      return List<DeviceEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> updateDevice(String name, String pushNotificationToken) async {
    try {
      final res =
          await _deviceService.updateDevice(name, pushNotificationToken);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> deleteDevice(String id) async {
    try {
      final res = _deviceService.deleteDevice(id);
      // if (res.statusCode == 200) {
      //   return true;
      // } else {
      //   return false;
      // }
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
