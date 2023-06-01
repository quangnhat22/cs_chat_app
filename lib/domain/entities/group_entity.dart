import 'package:chatapp/data/models/group_model.dart';

class GroupEntity {
  final String id;
  final String? name;
  final List<String>? members;
  final String? imageUrl;

  GroupEntity({
    required this.id,
    this.name,
    this.members,
    this.imageUrl,
  });

  static final groupEntityEmpty = GroupEntity(id: "-1");

  static GroupEntity convertToGroupEntity({
    GroupModel? groupModel,
  }) {
    if (groupModel == null) return groupEntityEmpty;
    return GroupEntity(
      id: groupModel.id,
      name: groupModel.name,
      members: groupModel.members,
      imageUrl: groupModel.imageUrl,
    );
  }
}
