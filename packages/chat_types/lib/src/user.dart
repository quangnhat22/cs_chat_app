part of 'base.dart';

enum Role { admin, agent, moderator, user }

@freezed
class User  with _$User {
  User._();

  factory User({
    required String id,
    int? createdAt,
    String? name,
    String? avatar,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) =>
      _$UserFromJson(json);
}
