import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderButtonDetail extends StatelessWidget {
  const HeaderButtonDetail({super.key});

  void _handleOnPress(BuildContext ctx) {
    final chatRoomBlocState = ctx.read<ChatRoomBloc>().state;
    if (chatRoomBlocState is ChatRoomInfoSuccess) {
      final userInfo = chatRoomBlocState.chatRoomId;
      if (chatRoomBlocState.isGroupChatRoom) {
        //
      } else {
        NavigationUtil.pushNamed(route: RouteName.friendInfo, args: userInfo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _handleOnPress(context),
      icon: const Icon(Icons.more_vert),
    );
  }
}
