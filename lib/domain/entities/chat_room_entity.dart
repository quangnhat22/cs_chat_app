import 'package:chatapp/data/models/chat_room_model.dart';
import 'package:chatapp/domain/entities/user_entity.dart';

class ChatRoomEntity {
  final String id;
  final String? name;
  final String? avatar;
  final List<UserEntity>? members;
  final String? chatRoomId;
  final String? type;

  ChatRoomEntity({
    required this.id,
    this.name,
    this.avatar,
    this.members,
    this.chatRoomId,
    this.type,
  });

  static final chatRoomEntityEmpty = ChatRoomEntity(id: "-1");

  static ChatRoomEntity convertToChatRoomEntity({
    ChatRoomModel? chatRoomModel,
  }) {
    if (chatRoomModel == null) return chatRoomEntityEmpty;
    return ChatRoomEntity(
      id: chatRoomModel.id,
      name: chatRoomModel.name,
      members: chatRoomModel.members
          ?.map((user) => UserEntity.convertToUserEntity(userModel: user))
          .toList(),
      avatar: chatRoomModel.imageUrl ?? chatRoomModel.avatar,
      chatRoomId: chatRoomModel.type == "group"
          ? chatRoomModel.id
          : chatRoomModel.group,
      type: chatRoomModel.type == "group" ? "group" : "friend",
    );
  }
}
