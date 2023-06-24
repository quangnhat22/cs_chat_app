import 'package:chatapp/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  ChatRoomModel._();

  factory ChatRoomModel({
    required String id,
    String? name,
    String? avatar,
    @JsonKey(name: "image_url") String? imageUrl,
    List<UserModel>? members,
    String? group,
    String? type,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
