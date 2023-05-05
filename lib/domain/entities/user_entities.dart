class UserEntity {
  final String id;
  final String? name;
  final String? avatar;
  final String? email;
  final String? phone;
  final String? gender;
  final String? bio;
  final DateTime? birthday;
  final int? commonFriendCount;
  final bool? isFriend;

  UserEntity({
    required this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.gender,
    this.bio,
    this.birthday,
    this.commonFriendCount,
    this.isFriend,
  });

  static UserEntity convertToUserEntity({
    required id,
    String? name,
    String? avatar,
    String? email,
    String? phone,
    String? gender,
    String? bio,
    DateTime? birthday,
    int? commonFriendCount,
    bool? isFriend,
  }) {
    return UserEntity(
      id: id,
      name: name,
      avatar: avatar,
      email: email,
      phone: phone,
      gender: gender,
      bio: bio,
      birthday: birthday,
      commonFriendCount: commonFriendCount,
      isFriend: isFriend,
    );
  }
}
