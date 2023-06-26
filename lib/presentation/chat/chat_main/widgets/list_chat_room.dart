import 'package:chatapp/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:chatapp/core/config/app_assets.dart';
import 'package:chatapp/presentation/chat/chat_main/bloc/list_chat_room_bloc.dart';
import 'package:chatapp/presentation/chat/chat_main/widgets/list_chat_room_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListChatRoom extends StatelessWidget {
  const ListChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListChatRoomBloc, ListChatRoomState>(
      builder: (context, state) {
        return state.maybeWhen(
          getListChatRoomInSuccess: (listChatRoom) {
            if (listChatRoom.isEmpty) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 120, horizontal: 64),
                  child: AppAssets.chatPlaceHolder,
                ),
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListChatRoomItem(
                    chatRoom: listChatRoom[index],
                  );
                },
                childCount: listChatRoom.length,
              ),
            );
          },
          getListChatRoomInFailure: (message) =>
              SliverToBoxAdapter(child: Text(message ?? "")),
          orElse: () => const SliverToBoxAdapter(child: ListSkeleton()),
        );
      },
    );
  }
}
