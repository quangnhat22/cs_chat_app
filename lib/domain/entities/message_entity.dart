import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/data/models/message_model.dart';
import 'package:chatapp/domain/entities/group_entity.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

@freezed
class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String id,
    String? type,
    UserEntity? sender,
    GroupEntity? groupEntity,
    UserEntity? receiver,
    String? message,
    String? videoUrl,
    String? recordUrl,
    DateTime? createdAt,
    bool? isMe,
    String? optional,
    String? systemEvent,
    int? sizeImage,
    AppSendMessageStatus? sendStatus,
    @Default(false) bool? isResultSearch,
    @Default(false) bool? isSameDate,
  }) = _MessageEntity;

  static const messageEntityEmpty = MessageEntity(id: "-1");

  static MessageEntity convertToMessageEntity(
      {MessageModel? model, bool isSameDate = false}) {
    if (model == null) return messageEntityEmpty;
    return MessageEntity(
      id: model.id,
      type: model.type,
      sender: UserEntity.convertToUserEntity(userModel: model.sender),
      groupEntity: model.group == null
          ? null
          : GroupEntity.convertToGroupEntity(groupModel: model.group),
      receiver: model.receiver == null
          ? null
          : UserEntity.convertToUserEntity(userModel: model.receiver),
      message: model.message,
      videoUrl: model.videoUrl,
      recordUrl: model.recordUrl,
      createdAt: model.createdAt,
      isMe: model.isMe,
      isSameDate: isSameDate,
      systemEvent: model.systemEvent,
      sizeImage: model.sizeImage,
      optional: model.optional,
    );
  }
}
