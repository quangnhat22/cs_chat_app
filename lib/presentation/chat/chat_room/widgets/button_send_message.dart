import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart';
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSendMessage extends StatelessWidget {
  const ButtonSendMessage({Key? key}) : super(key: key);

  void _handleSendMessage(BuildContext ctx, String? message) async {
    if (message != null && message.trim().isNotEmpty) {
      await ctx.read<MessageStreamCubit>().sendMessage(
            type: "text",
            message: message.trim(),
          );

      if (ctx.mounted) {
        ctx.read<InputMessageCubit>().inputMessageChanged("");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputMessageCubit, InputMessageState>(
      builder: (context, state) {
        return state.when(
          initial: (input) {
            return input != null && input.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _handleSendMessage(context, input);
                    },
                    icon: const Icon(Icons.near_me),
                  )
                : Container();
          },
        );
      },
    );
  }
}
