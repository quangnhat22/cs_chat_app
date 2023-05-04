class UserEntity {
  final String id;
  final String? name;
  final String? avatar;
  final String? phone;
  final String? gender;
  DateTime? birthday;
  int? commonFriendCount;
  bool? isFriend;

  UserEntity({
    required this.id,
    this.name,
    this.avatar,
    this.phone,
    this.gender,
    this.birthday,
    this.commonFriendCount,
    this.isFriend,
  });
}
