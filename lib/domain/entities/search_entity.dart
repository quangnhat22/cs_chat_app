import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/entities/user_entity.dart';

import '../../data/models/search_model.dart';

class SearchEntity {
  List<UserEntity>? friends;
  List<ChatRoomEntity>? groups;
  List<ChatRoomEntity>? messages;

  SearchEntity({this.friends, this.groups, this.messages});

  static final searchEntityEmpty = SearchEntity();

  static SearchEntity convertToSearchEntity({SearchModel? model}) {
    if (model == null) return searchEntityEmpty;

    return SearchEntity(
      friends: model.friends
          ?.map((friend) => UserEntity.convertToUserEntity(userModel: friend))
          .toList(),
      groups: model.groups
          ?.map((group) =>
              ChatRoomEntity.convertToChatRoomEntity(chatRoomModel: group))
          .toList(),
      messages: model.messages
          ?.map((message) =>
              ChatRoomEntity.convertToChatRoomEntity(chatRoomModel: message))
          .toList(),
    );
  }
}
