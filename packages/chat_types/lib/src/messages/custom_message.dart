part of '../base.dart';

@freezed
class CustomMessage extends Message  with _$CustomMessage {
  const factory CustomMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    @Default(MessageType.custom) MessageType type,
    int? updatedAt,
  })  = _CustomMessage;

  factory CustomMessage.fromJson(Map<String, Object?> json) =>
      _$CustomMessageFromJson(json);
}