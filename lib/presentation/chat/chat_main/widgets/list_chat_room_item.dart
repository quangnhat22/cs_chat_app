import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:chatapp/core/config/app_text_style.dart';
import 'package:chatapp/core/utils/date_time_format.dart';
import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_navigation.dart';
import '../../../../core/routes/route_name.dart';

class ListChatRoomItem extends StatelessWidget {
  final ChatRoomEntity chatRoom;

  const ListChatRoomItem({
    super.key,
    required this.chatRoom,
  });

  void _clickedChatRoomItem() {
    NavigationUtil.pushNamed(route: RouteName.chatRoom, args: {
      "id": chatRoom.id,
      "chatRoomId": chatRoom.id,
      "type": chatRoom.type,
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
                        urlImage: chatRoom.avatar,
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
                                chatRoom.name ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              if (chatRoom.latestMessageEntity?.senderName !=
                                      null &&
                                  chatRoom.latestMessageEntity?.message != null)
                                Text(
                                  "${chatRoom.latestMessageEntity?.senderName}: ${chatRoom.latestMessageEntity?.message}",
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
                          chatRoom.latestMessageEntity?.createdAt ??
                              DateTime.now()),
                    ),
                    const SizedBox(
                      height: 4,
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
