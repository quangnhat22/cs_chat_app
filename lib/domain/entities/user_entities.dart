class UserEntity {
  final String id;
  final String? name;
  final String? avatar;
  final String? email;
  final String? phone;
  final String? gender;
  DateTime? birthday;
  int? commonFriendCount;
  bool? isFriend;

  UserEntity({
    required this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.gender,
    this.birthday,
    this.commonFriendCount,
    this.isFriend,
  });

  static UserEntity convertToUserEntity({
    required id,
    name,
    avatar,
    email,
    phone,
    gender,
    birthday,
    commonFriendCount,
    isFriend,
  }) {
    return UserEntity(
      id: id,
      name: name,
      avatar: avatar,
      email: email,
      phone: phone,
      gender: gender,
      birthday: birthday,
      commonFriendCount: commonFriendCount,
      isFriend: isFriend,
    );
  }
}
