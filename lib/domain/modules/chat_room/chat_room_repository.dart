import '../../entities/chat_room_entity.dart';
import '../../entities/message_entity.dart';

abstract class ChatRoomRepository {
  Future<void> connectSocket();

  Future<void> disconnectSocket();

  Future<List<ChatRoomEntity>> getListChatRoom(String? query);

  Future<ChatRoomEntity> getChatRoomDetailById(String id);

  Future<List<MessageEntity>> getListMessage({
    required String chatRoomId,
    required int limit,
    required order,
    String? lastId,
    String? type,
  });

  Stream<MessageEntity> getChatRoomUpdated();
}
