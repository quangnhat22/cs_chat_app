part of 'base.dart';

/// All possible room types.
enum RoomType { channel, direct, group }

@freezed
class Room  with _$Room {
  Room._();

  factory Room({
    required String id,
    String? name,
    int? createdAt,
    required RoomType? type,
    String? imageUrl,
    required List<User> users,
    List<Message>? lastMessages,
    Map<String, dynamic>? metadata,
    int? updatedAt,
  }) = _Room;

  factory Room.fromJson(Map<String, Object?> json) =>
      _$RoomFromJson(json);
}
