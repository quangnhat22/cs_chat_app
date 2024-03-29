import 'package:chatapp/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getListNotification();
  Future<bool> deleteNotificationById(String id);
  Future<bool> deleteAllNotification();
  Future<bool> changeTurnOnAndOffNotification(bool isTurnOn);
}
