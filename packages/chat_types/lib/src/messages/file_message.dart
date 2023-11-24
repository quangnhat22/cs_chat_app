part of '../base.dart';

@freezed
class FileMessage extends Message  with _$FileMessage {
  const factory FileMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    @Default(MessageType.file) MessageType type,
    int? updatedAt,
    bool? isLoading,
    String? mimeType,
    required String name,
    required num size,
    required String uri,
  })  = _FileMessage;

  factory FileMessage.fromJson(Map<String, Object?> json) =>
      _$FileMessageFromJson(json);
}