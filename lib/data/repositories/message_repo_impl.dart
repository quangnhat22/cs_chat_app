import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/message/message_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MessageRepository)
class MessageRepositoryImpl extends MessageRepository {
  final ChatWebSocket _socket;

  MessageRepositoryImpl({required ChatWebSocket chatWebSocket})
      : _socket = chatWebSocket;

  @override
  Future<void> connectSocket() async {
    try {
      _socket.connect();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> disconnectSocket() async {
    try {
      _socket.disconnect();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<MessageEntity> getNewMessage() {
    try {
      return _socket.getStream().map(
          (message) => MessageEntity.convertToMessageEntity(model: message));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> sendMessage(
      String type, String message, String receiverUserId) async {
    try {
      _socket.sendMessage(type, message, receiverUserId);
    } catch (e) {
      throw Exception(e);
    }
  }
}
