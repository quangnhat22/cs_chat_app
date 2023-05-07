import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart';
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart';
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSendMessage extends StatelessWidget {
  const ButtonSendMessage({Key? key}) : super(key: key);

  void _handleSendMessage(BuildContext ctx, String? message) {
    if (message != null && message.trim().isNotEmpty) {
      final stateChatRoom = ctx.read<ChatRoomBloc>().state;
      if (stateChatRoom is ChatRoomInfoSuccess) {
        final receiverUserId = stateChatRoom.user.id;
        ctx
            .read<MessageStreamCubit>()
            .sendMessage("text", message, receiverUserId);
        ctx.read<InputMessageCubit>().inputMessageChanged("");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputMessageCubit, InputMessageState>(
      builder: (context, state) {
        return state.when(
          initial: (input) => IconButton(
            onPressed: () {
              _handleSendMessage(context, input);
            },
            icon: const Icon(Icons.send_rounded),
          ),
        );
      },
    );
  }
}
