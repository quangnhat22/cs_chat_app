import '../../entities/chat_room_entity.dart';
import '../../entities/message_entity.dart';

abstract class ChatRoomRepository {
  Future<List<ChatRoomEntity>> getListChatRoom(String? query);

  Future<List<MessageEntity>> getListMessage({
    required String chatRoomId,
    required int limit,
    required order,
    String? lastId,
    String? type,
  });
}
