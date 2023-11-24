part of '../base.dart';

@freezed
class SystemMessage extends Message  with _$SystemMessage {
  const factory SystemMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    required String text,
    @Default(MessageType.system) MessageType type,
    int? updatedAt,
  })  = _SystemMessage;

  factory SystemMessage.fromJson(Map<String, Object?> json) =>
      _$SystemMessageFromJson(json);
}