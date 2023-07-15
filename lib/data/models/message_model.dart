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
    // ignore: invalid_annotation_target
    @JsonKey(name: "video_url") String? videoUrl,
    // ignore: invalid_annotation_target
    @JsonKey(name: "system_event") String? systemEvent,
    // ignore: invalid_annotation_target
    @JsonKey(name: "record_url") String? recordUrl,
    String? optional,
    // ignore: invalid_annotation_target
    @JsonKey(name: "created_at") DateTime? createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(name: "is_me") bool? isMe,
    // ignore: invalid_annotation_target
    @JsonKey(name: "size_image") int? sizeImage,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
