import 'package:chatapp/data/models/latest_message_model.dart';
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
    // ignore: invalid_annotation_target
    @JsonKey(name: "image_url") String? imageUrl,
    List<UserModel>? members,
    String? type,
    // ignore: invalid_annotation_target
    @JsonKey(name: "latest_message") LatestMessageModel? latestMessage,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
