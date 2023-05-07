import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/message/message_repository.dart';
import 'package:injectable/injectable.dart';

abstract class MessageUseCase {
  Future<void> connectSocket();

  Future<void> disconnectSocket();

  Future<void> sendMessage(String type, String message, String receiverUserId);

  Stream<MessageEntity> getNewMessage();
}

@Injectable(as: MessageUseCase)
class MessageUseCaseImpl extends MessageUseCase {
  final MessageRepository repo;

  MessageUseCaseImpl({required this.repo});

  @override
  Future<void> connectSocket() async {
    return repo.connectSocket();
  }

  @override
  Future<void> disconnectSocket() {
    return repo.disconnectSocket();
  }

  @override
  Stream<MessageEntity> getNewMessage() {
    return repo.getNewMessage();
  }

  @override
  Future<void> sendMessage(String type, String message, String receiverUserId) {
    return repo.sendMessage(type, message, receiverUserId);
  }
}
