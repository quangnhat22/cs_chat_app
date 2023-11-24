part of '../base.dart';

@freezed
class UnsupportedMessage extends Message  with _$UnsupportedMessage {
  const factory UnsupportedMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    @Default(MessageType.unsupported) MessageType type,
    int? updatedAt,
  })  = _UnsupportedMessage;

  factory UnsupportedMessage.fromJson(Map<String, Object?> json) =>
      _$UnsupportedMessageFromJson(json);
}