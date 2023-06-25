import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/chat_room/chat_room_repository.dart';
import 'package:injectable/injectable.dart';

abstract class ChatRoomUseCase {
  //query: personal, group, all
  Future<List<ChatRoomEntity>> getListChatRoom(String? query);

  Future<List<MessageEntity>> getListMessage({
    required String chatRoomId,
    int limit = 20,
    String order = 'dsc',
    String? lastId,
    String? type,
  });
}

@Injectable(as: ChatRoomUseCase)
class ChatRoomUseCaseImpl extends ChatRoomUseCase {
  final ChatRoomRepository _repo;

  ChatRoomUseCaseImpl(this._repo);

  @override
  Future<List<MessageEntity>> getListMessage(
      {required String chatRoomId,
      String? lastId,
      int limit = 20,
      String order = 'dsc',
      String? type}) {
    return _repo.getListMessage(
      chatRoomId: chatRoomId,
      limit: limit,
      lastId: lastId,
      order: order,
      type: type,
    );
  }

  @override
  Future<List<ChatRoomEntity>> getListChatRoom(String? query) {
    return _repo.getListChatRoom(query);
  }
}
