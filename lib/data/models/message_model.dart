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
    UserModel? receiver,
    String? message,
    String? optional,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "is_me") bool? isMe,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
