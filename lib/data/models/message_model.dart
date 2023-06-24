import 'package:chatapp/data/models/group_model.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  MessageModel._();

  factory MessageModel({
    required String id,
    String? type,
    UserModel? sender,
    GroupModel? group,
    UserModel? receiver,
    String? message,
    @JsonKey(name: "video_url") String? videoUrl,
    @JsonKey(name: "record_url") String? recordUrl,
    String? optional,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "is_me") bool? isMe,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
