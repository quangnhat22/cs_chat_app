part of 'base.dart';

/// All possible room types.
enum MessageType {  audio,
  custom,
  file,
  image,
  system,
  text,
  unsupported,
  video,
}

/// All possible statuses message can have.
enum Status { delivered, error, seen, sending, sent }

@immutable
abstract class Message  {
  const Message({
    required this.author,
    this.createdAt,
    required this.id,
    this.metadata,
    this.remoteId,
    this.repliedMessage,
    this.roomId,
    this.showStatus,
    this.status,
    required this.type,
    this.updatedAt,
  });


  /// Unique ID of the message.
  final String id;
  final User author;
  final Map<String, dynamic>? metadata;
  /// Unique ID of the message received from the backend.
  final String? remoteId;
  final Message? repliedMessage;
  final String? roomId;
  final bool? showStatus;
  final Status? status;
  final MessageType type;
  final int? createdAt;
  final int? updatedAt;



  factory Message.fromJson(Map<String, dynamic> json) {
    final type = MessageType.values.firstWhere(
          (e) => e.name == json['type'],
      orElse: () => MessageType.unsupported,
    );

    switch (type) {
      case MessageType.audio:
        return AudioMessage.fromJson(json);
      case MessageType.custom:
        return CustomMessage.fromJson(json);
      case MessageType.file:
        return FileMessage.fromJson(json);
      case MessageType.image:
        return ImageMessage.fromJson(json);
      case MessageType.system:
        return SystemMessage.fromJson(json);
      case MessageType.text:
        return TextMessage.fromJson(json);
      case MessageType.unsupported:
        return UnsupportedMessage.fromJson(json);
      case MessageType.video:
        return VideoMessage.fromJson(json);
    }
  }

  Map<String, dynamic> toJson(){return  <String, dynamic>{};}
}
