import 'package:chatapp/presentation/chat/chat_room/widgets/footer_chat_actions.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/list_message.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/title_chat_room.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ChatRoomView();
  }
}

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const TitleChatRoom(),
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: CustomScrollView(
              reverse: true,
              slivers: <Widget>[
                ListMessage(),
              ],
            ),
          ),
          FooterChatActions(),
        ],
      ),
    );
  }
}
