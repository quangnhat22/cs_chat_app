import 'package:chatapp/data/models/group_request_model.dart';
import 'package:chatapp/domain/entities/group_entity.dart';

class GroupRequestEntity {
  final GroupEntity? sender;
  final GroupEntity? receiver;
  final DateTime? createdAt;

  GroupRequestEntity({this.sender, this.receiver, this.createdAt});

  static final groupRequestEmpty = GroupRequestEntity();

  static GroupRequestEntity convertToGroupRequestEntity({
    GroupRequestModel? model,
  }) {
    if (model == null) return groupRequestEmpty;
    return GroupRequestEntity(
      sender: GroupEntity.convertToGroupEntity(groupModel: model.sender),
      receiver: GroupEntity.convertToGroupEntity(groupModel: model.receiver),
      createdAt: model.createdAt,
    );
  }
}
