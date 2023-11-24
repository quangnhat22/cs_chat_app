part of '../base.dart';

@freezed
class TextMessage extends Message  with _$TextMessage {
  const factory TextMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    @Default(MessageType.text) MessageType type,
    int? updatedAt,
    PreviewData? previewData,
    required String text,
  })  = _TextMessage;

  factory TextMessage.fromJson(Map<String, Object?> json) =>
      _$TextMessageFromJson(json);
}