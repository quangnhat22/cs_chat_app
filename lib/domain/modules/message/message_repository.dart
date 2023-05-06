abstract class MessageRepository {
  Future<void> connectSocket();
  Future<void> disconnectSocket();
  Future<void> sendMessage(String type, String message, String receiverUserId);
  Stream<dynamic> getNewMessage();
}
