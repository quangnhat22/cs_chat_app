import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    String? name,
    String? avatar,
    String? phone,
    String? gender,
    DateTime? birthday,
    // ignore: invalid_annotation_target
    @JsonKey(name: "common_friend_count", ignore: true) int? commonFriendCount,
    // ignore: invalid_annotation_target
    @JsonKey(name: "is_friend", ignore: true) bool? isFriend,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
