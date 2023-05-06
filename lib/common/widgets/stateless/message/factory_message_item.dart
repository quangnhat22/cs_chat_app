import 'message_item.dart';
import 'message_item/image_message_item.dart';
import 'message_item/text_message_item.dart';

class FactoryMessageItem {
  static IMessageItem buildMessageItem(
    String? type,
    bool? isMe,
    String? content,
    String? nameActor,
  ) {
    switch (type) {
      case "text":
        {
          return TextMessageItem(content: content, isMe: isMe ?? false);
        }
      case "image":
        {
          return ImageMessageItem(content: content, isMe: isMe ?? false);
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
      // case "video":
      //   {
      //     return VideoMessageItem(
      //       isMe: isMe ?? false,
      //       content: content,
      //     );
      //   }
      // case "record":
      //   {
      //     return AudioMessage(
      //       content: content!,
      //       isMe: isMe ?? false,
      //     );
      //   }
      default:
        {
          return TextMessageItem(content: content, isMe: isMe ?? false);
        }
    }
  }
}
