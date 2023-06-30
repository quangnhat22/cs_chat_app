import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:chatapp/core/config/app_text_style.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/core/utils/date_time_format.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';

class ResultMessageItem extends StatelessWidget {
  final MessageEntity messageEntity;

  const ResultMessageItem({
    super.key,
    required this.messageEntity,
  });

  void _clickedChatRoomItem() {
    NavigationUtil.pushNamed(route: RouteName.chatRoom, args: {
      "id": messageEntity.groupEntity!.id,
      "chatRoomId": messageEntity.groupEntity!.id,
      "type": messageEntity.groupEntity!.type,
      "search_message": messageEntity,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _clickedChatRoomItem,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CustomAvatarImage(
                        urlImage: messageEntity.groupEntity?.imageUrl,
                        widthImage: 48,
                        heightImage: 48,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                messageEntity.groupEntity?.name ??
                                    "Unknow group",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              if (messageEntity.sender?.name != null &&
                                  messageEntity.message != null)
                                Text(
                                  "${messageEntity.sender?.name}: ${messageEntity.message}",
                                  style: AppTextStyles.captionTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppDateTimeFormat.convertToHourMinuteFollowDay(
                          messageEntity.createdAt ?? DateTime.now()),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const DividerSpaceLeft(),
        ],
      ),
    );
  }
}
