import 'package:chatapp/data/models/message_model.dart';
import 'package:chatapp/domain/entities/user_entity.dart';

class MessageEntity {
  final String id;
  final String? type;
  final UserEntity? sender;
  final UserEntity? receiver;
  final String? message;
  final DateTime? createdAt;
  final bool? isMe;

  MessageEntity(
      {required this.id,
      this.type,
      this.sender,
      this.receiver,
      this.message,
      this.createdAt,
      this.isMe});

  static final messageEntityEmpty = MessageEntity(id: "-1");

  static MessageEntity convertToMessageEntity({
    MessageModel? model,
  }) {
    if (model == null) return messageEntityEmpty;
    return MessageEntity(
      id: model.id,
      type: model.type,
      sender: UserEntity.convertToUserEntity(userModel: model.sender),
      receiver: UserEntity.convertToUserEntity(userModel: model.receiver),
      message: model.message,
      createdAt: model.createdAt,
      isMe: model.isMe,
    );
  }
}
