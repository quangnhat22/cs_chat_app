import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/presentation/friends/friends_detail/cubit/friend_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/friend_details_small_card_bottom.dart';
import '../widgets/personal_chat_room_info.dart';

class FriendDetailPage extends StatelessWidget {
  const FriendDetailPage({
    super.key,
    required this.chatRoomId,
    required this.friendId,
  });

  final String chatRoomId;
  final String friendId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FriendDetailCubit>()
        ..getGroupDetails(id: friendId, chatRoomId: chatRoomId),
      child: const FriendDetailView(),
    );
  }
}

class FriendDetailView extends StatelessWidget {
  const FriendDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MPageAppBar(title: "Detail"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              PersonalChatRoomInfo(),
              FriendDetailsSmallCardBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
