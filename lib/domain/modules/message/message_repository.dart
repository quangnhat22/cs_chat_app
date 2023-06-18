import 'package:chatapp/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<void> connectSocket(String id, String type);

  Future<void> disconnectSocket();

  Future<void> sendMessage(String type, String message, String? option);

  Stream<MessageEntity> getNewMessage();
}
