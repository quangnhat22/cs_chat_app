import 'package:chatapp/common/widgets/stateless/message/message_item/giphy_message_item.dart';
import 'package:chatapp/common/widgets/stateless/message/message_item/map_message_item.dart';
import 'package:flutter/material.dart';

import 'message_item.dart';
import 'message_item/audio_message_item.dart';
import 'message_item/file_message_item.dart';
import 'message_item/image_message_item.dart';
import 'message_item/system_message_item.dart';
import 'message_item/text_message_item.dart';
import 'message_item/video_message_item.dart';

class FactoryMessageItem {
  static IMessageItem buildMessageItem({
    required String id,
    String? type,
    bool? isMe,
    String? content,
    String? videoUrl,
    String? nameActor,
    DateTime? createdAt,
    String? systemEvent,
    int? fileSize,
  }) {
    switch (type) {
      case "text":
        {
          return TextMessageItem(
            content: content,
            isMe: isMe ?? false,
            createdAt: createdAt,
          );
        }
      case "image":
        {
          return ImageMessageItem(
            content: content,
            isMe: isMe ?? false,
            createdAt: createdAt,
          );
        }
      case "system":
        {
          return SystemMessageItem(
            nameActor: nameActor,
            content: systemEvent!,
          );
        }
      case "video":
        {
          return VideoMessageItem(
            isMe: isMe ?? false,
            content: content,
            videoUrl: videoUrl,
          );
        }
      case "audio":
        {
          return AudioMessage(
            content: content!,
            isMe: isMe ?? false,
          );
        }
      case "file":
        {
          return FileMessageItem(
            key: ValueKey(id),
            content: content!,
            isMe: isMe ?? false,
            sizeImage: fileSize,
          );
        }
      case "giphy":
        {
          return GiphyMessageItem(
            key: ValueKey(id),
            isMe: isMe ?? false,
            content: content,
          );
        }
      case "map":
        {
          return MapMessageItem(
            content: content!,
            isMe: isMe ?? false,
          );
        }
      default:
        {
          return TextMessageItem(
            content: content,
            isMe: isMe ?? false,
            createdAt: createdAt,
          );
        }
    }
  }
}
