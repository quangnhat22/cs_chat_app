import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_message_model.freezed.dart';
part 'latest_message_model.g.dart';

@freezed
class LatestMessageModel with _$LatestMessageModel {
  LatestMessageModel._();

  factory LatestMessageModel({
    String? message,
    // ignore: invalid_annotation_target
    @JsonKey(name: "send_id") String? senderId,
    // ignore: invalid_annotation_target
    @JsonKey(name: "sender_name") String? senderName,
    // ignore: invalid_annotation_target
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _LatestMessageModel;

  factory LatestMessageModel.fromJson(Map<String, dynamic> json) =>
      _$LatestMessageModelFromJson(json);
}
