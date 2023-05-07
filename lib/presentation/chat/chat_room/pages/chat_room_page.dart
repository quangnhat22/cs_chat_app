import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart';
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/footer_chat_actions.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/list_message.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/title_chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<ChatRoomBloc>()..add(ChatRoomEvent.started(id: userId)),
        ),
        BlocProvider(
          create: (_) => getIt<MessageStreamCubit>()..started(),
        ),
      ],
      child: const ChatRoomView(),
    );
  }
}

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageStreamCubit, MessageStreamState>(
      listener: (context, state) {
        state.whenOrNull(receivedNewMessageSuccess: (message) {
          context
              .read<ChatRoomBloc>()
              .add(ChatRoomNewMessageNotified(newMessage: message));
        });
      },
      child: Scaffold(
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
      ),
    );
  }
}
