import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/message/message_repository.dart';
import 'package:injectable/injectable.dart';

abstract class MessageUseCase {
  Future<void> connectSocket(String id, String type);

  Future<void> disconnectSocket();

  Future<void> sendMessage(
      {required String type, required String message, String? option});

  Stream<MessageEntity> getNewMessage();
}

@Injectable(as: MessageUseCase)
class MessageUseCaseImpl extends MessageUseCase {
  final MessageRepository repo;

  MessageUseCaseImpl({required this.repo});

  @override
  Future<void> connectSocket(String id, String type) async {
    return repo.connectSocket(id, type);
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
  Future<void> sendMessage(
      {required String type, required String message, String? option}) {
    return repo.sendMessage(type, message, option);
  }
}
