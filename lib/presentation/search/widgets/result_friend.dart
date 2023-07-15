import 'package:chatapp/presentation/friends/friends_contact/friends_contact.dart';
import 'package:chatapp/presentation/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultFriend extends StatelessWidget {
  const ResultFriend({Key? key}) : super(key: key);

  // void _handleTapChatRoomItem(BuildContext ctx, String chatRoomId) {
  //   // ctx.pushNamed(
  //   //   ChatDetailPage.namePage,
  //   //   params: {'chatRoomId': chatRoomId},
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (prev, current) => prev.friends != current.friends,
      builder: (context, state) {
        if (state.friends != null && state.friends!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Your friends",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListFriendItem(
                  id: state.friends![index].id,
                  email: state.friends![index].email,
                  avatar: state.friends![index].avatar,
                  name: state.friends![index].name,
                  chatRoomId: state.friends![index].chatRoomId,
                  type: "personal",
                ),
                itemCount: state.friends!.length,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
