import 'package:chatapp/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
class GroupModel with _$GroupModel {
  GroupModel._();

  factory GroupModel({
    required String id,
    String? name,
    List<UserModel>? members,
    // ignore: invalid_annotation_target
    @JsonKey(name: "image_url") String? imageUrl,
    String? type,
    bool? active,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
