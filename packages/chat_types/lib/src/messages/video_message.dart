part of '../base.dart';

@freezed
class VideoMessage extends Message  with _$VideoMessage {
  const factory VideoMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    @Default(MessageType.video) MessageType type,
    int? updatedAt,
    double? height,
    required String name,
    required num size,
    required String uri,
    double? width,
  })  = _VideoMessage;

  factory VideoMessage.fromJson(Map<String, Object?> json) =>
      _$VideoMessageFromJson(json);
}