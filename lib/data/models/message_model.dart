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
    // ignore: invalid_annotation_target
    @JsonKey(name: "created_at", ignore: true) DateTime? createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  // "id": "64561ba36de2403c19e5c9ab",
  //       "type": "text",
  //       "sender": "6455d0636de2403c19e5c9a3",
  //       "receiver": "6455cfdd6de2403c19e5c99f",
  //       "message": "Hello world",
  //       "created_at": "2023-05-06T09:19:31.066Z"
}
