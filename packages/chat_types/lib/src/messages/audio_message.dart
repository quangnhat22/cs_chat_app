part of '../base.dart';

@freezed
class AudioMessage extends Message  with _$AudioMessage {
  const factory AudioMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
    required Duration duration,
    required String name,
    required num size,
    required String uri,
    String? mimeType,
    @Default(MessageType.audio) MessageType type,
    List<double>? waveForm,
  })  = _AudioMessage;

  factory AudioMessage.fromJson(Map<String, Object?> json) =>
      _$AudioMessageFromJson(json);
}