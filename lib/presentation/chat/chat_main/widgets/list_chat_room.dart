import 'package:chatapp/core/config/app_assets.dart';
import 'package:chatapp/core/utils/date_time_format.dart';
import 'package:chatapp/presentation/chat/chat_main/widgets/list_chat_room_item.dart';
import 'package:flutter/material.dart';

class ListChatRoom extends StatelessWidget {
  const ListChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return true
        ? SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 120, horizontal: 64),
              child: AppAssets.chatPlaceHolder,
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListChatRoomItem(
                  name: "Nguyễn Văn A",
                  lastestMessage: "NguyenVanA: Hello",
                  time: AppDateTimeFormat.formatDDMMYYYY(DateTime.now()),
                );
              },
              childCount: 100,
            ),
          );
  }
}
