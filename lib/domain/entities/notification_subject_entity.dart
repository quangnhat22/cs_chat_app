import 'package:chatapp/data/models/notification_subject_model.dart';

class NotificationSubjectEntity {
  final String id;
  final String? name;
  final String? image;
  final String? type;

  NotificationSubjectEntity({
    required this.id,
    this.name,
    this.image,
    this.type,
  });

  static final notificationSubjecttEmpty = NotificationSubjectEntity(id: "-1");

  static NotificationSubjectEntity convertToFriendRequestEntity({
    NotificationSubjectModel? model,
  }) {
    if (model == null) return notificationSubjecttEmpty;
    return NotificationSubjectEntity(
        id: model.id, name: model.name, image: model.image, type: model.type);
  }
}
