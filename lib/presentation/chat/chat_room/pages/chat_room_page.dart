import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart';
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart';
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/button_detail_chat_room.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/footer_chat_actions.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/list_messge_contrainer.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/title_chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key, required this.id, required this.type})
      : super(key: key);

  final String id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ChatRoomBloc>()
            ..add(ChatRoomEvent.started(id: id, type: type)),
        ),
        BlocProvider(
          create: (_) => getIt<MessageStreamCubit>()..started(id, type),
        ),
        BlocProvider(
          create: (_) => getIt<InputMessageCubit>(),
        ),
      ],
      child: ChatRoomView(type: type),
    );
  }
}

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MessageStreamCubit, MessageStreamState>(
          listener: (context, state) {
            state.whenOrNull(
              receivedNewMessageSuccess: (message) {
                context.read<ChatRoomBloc>().add(
                      ChatRoomNewMessageNotified(
                        newMessage: message,
                        typeChatRoom: type,
                      ),
                    );
              },
              sendMessageInProgress: (id, message, type) {
                final newMessage = MessageEntity(
                  id: id,
                  message: message,
                  type: type,
                  isMe: true,
                  sendStatus: AppSendMessageStatus.sending,
                );
                context
                    .read<ChatRoomBloc>()
                    .add(ChatRoomAddMessageTemp(newMessage: newMessage));
              },
            );
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: const TitleChatRoom(),
          actions: const [HeaderButtonDetail()],
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: ListMessageContainer(type: type)),
            const FooterChatActions(),
          ],
        ),
      ),
    );
  }
}
