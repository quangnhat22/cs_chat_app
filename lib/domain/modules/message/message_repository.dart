import 'package:chatapp/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<void> connectSocket();

  Future<void> disconnectSocket();

  Future<void> sendMessage(
      String type, String message, String receiverUserId, String? option);

  Stream<MessageEntity> getNewMessage();
}
