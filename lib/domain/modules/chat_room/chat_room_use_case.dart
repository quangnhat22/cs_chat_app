import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/chat_room/chat_room_repository.dart';
import 'package:injectable/injectable.dart';

abstract class ChatRoomUseCase {
  Future<void> connectSocket();

  Future<void> disconnectSocket();

  //query: personal, group, all
  Future<List<ChatRoomEntity>> getListChatRoom(String? query);

  Future<ChatRoomEntity> getChatRoomDetailById(String id);

  Future<List<MessageEntity>> getListMessage({
    required String chatRoomId,
    int limit = 20,
    String order = 'dsc',
    String? lastId,
    String? type,
  });

  Stream<MessageEntity> getChatRoomUpdated();
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

  @override
  Future<void> connectSocket() {
    return _repo.connectSocket();
  }

  @override
  Future<void> disconnectSocket() {
    return _repo.disconnectSocket();
  }

  @override
  Future<ChatRoomEntity> getChatRoomDetailById(String id) {
    return _repo.getChatRoomDetailById(id);
  }

  //for update list chat room
  @override
  Stream<MessageEntity> getChatRoomUpdated() {
    return _repo.getChatRoomUpdated();
  }
}
