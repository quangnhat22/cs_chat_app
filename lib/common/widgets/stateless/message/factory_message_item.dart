import 'package:flutter/material.dart';

import 'message_item.dart';
import 'message_item/audio_message_item.dart';
import 'message_item/file_message_item.dart';
import 'message_item/image_message_item.dart';
import 'message_item/text_message_item.dart';
import 'message_item/video_message_item.dart';

class FactoryMessageItem {
  static IMessageItem buildMessageItem(
    String id,
    String? type,
    bool? isMe,
    String? content,
    String? videoUrl,
    String? nameActor,
    DateTime? createdAt,
  ) {
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
      // case "emoji":
      //   {
      //     return EmojiMessageItem(content: content!);
      //   }
      // case "sticker":
      //   {
      //     return StickerMessageItem(content: content!);
      //   }
      // case "system":
      //   {
      //     return SystemMessageItem(nameActor: nameActor, content: content!);
      //   }
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
          );
        }
      case "map":
        {
          return TextMessageItem(
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
