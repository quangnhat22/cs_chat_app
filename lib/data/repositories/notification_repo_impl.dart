import 'package:chatapp/core/utils/detect_info_device.dart';
import 'package:chatapp/data/data_sources/remote/service/device_service.dart';
import 'package:chatapp/data/data_sources/remote/service/notifications_service.dart';
import 'package:chatapp/data/models/notification_model.dart';
import 'package:chatapp/domain/entities/notification_entity.dart';
import 'package:chatapp/domain/modules/notification/notfication_repository.dart';
import 'package:chatapp/service/notification_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationsService _service;
  final NotificationService _awesomeService;
  final DeviceService _deviceService;

  NotificationRepositoryImpl(
      this._service, this._awesomeService, this._deviceService);

  @override
  Future<bool> changeTurnOnAndOffNotification(bool isTurnOn) async {
    try {
      // get device name
      final deviceName = await DetectDeviceInfo.getDeviceName();
      final fcmToken =
          isTurnOn ? await _awesomeService.getFirebaseMessagingToken() : '';
      final res = await _deviceService.updateDevice(deviceName, fcmToken);
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
  Future<bool> deleteAllNotification() async {
    try {
      final res = await _service.deleteAllNotification();
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> deleteNotificationById(String id) async {
    try {
      final res = await _service.deleteNotificationById(id);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<List<NotificationEntity>> getListNotification() async {
    try {
      final res = await _service.getListNotification();
      if (res.statusCode == 200) {
        final listDeviceJson = res.data["data"] as List<dynamic>?;
        if (listDeviceJson != null) {
          final listNotificationModel = listDeviceJson
              .map((notiJson) => NotificationsModel.fromJson(notiJson))
              .toList();

          final listNotiEntity = listNotificationModel
              .map((notiModel) =>
                  NotificationEntity.convertToNotificationEntity(
                      model: notiModel))
              .toList();

          return listNotiEntity;
        }
      }

      return List<NotificationEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
