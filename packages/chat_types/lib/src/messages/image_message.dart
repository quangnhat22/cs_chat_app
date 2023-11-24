part of '../base.dart';

@freezed
class ImageMessage extends Message  with _$ImageMessage {
  const factory ImageMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    @Default(MessageType.image) MessageType type,
    int? updatedAt,
    double? height,
    required String name,
    required num size,
    required String uri,
    double? width,
  })  = _ImageMessage;

  factory ImageMessage.fromJson(Map<String, Object?> json) =>
      _$ImageMessageFromJson(json);
}