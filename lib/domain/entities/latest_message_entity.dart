import 'package:chatapp/data/models/latest_message_model.dart';

class LatestMessageEntity {
  final String? message;
  final String? senderId;
  final String? senderName;
  final DateTime? createdAt;

  LatestMessageEntity({
    this.message,
    this.senderId,
    this.senderName,
    this.createdAt,
  });

  static final latestMessageEmpty = LatestMessageEntity();

  static LatestMessageEntity convertToGroupRequestEntity({
    LatestMessageModel? model,
  }) {
    if (model == null) return latestMessageEmpty;
    return LatestMessageEntity(
      message: model.message,
      senderId: model.senderId,
      senderName: model.senderName,
      createdAt: model.createdAt,
    );
  }
}
