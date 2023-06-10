import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart';
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputMessage extends StatefulWidget {
  const InputMessage({Key? key}) : super(key: key);

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      if (mounted) {
        context.read<InputMessageCubit>().inputMessageChanged(_controller.text);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageStreamCubit, MessageStreamState>(
      listener: (context, state) {
        state.whenOrNull(
          sendMessageSuccess: () => {
            _controller.text = "",
          },
          sendMessageFailure: (message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
        );
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: TextFormField(
          controller: _controller,
          minLines: 1,
          maxLines: null,
          // validator: (value) =>
          //     AppCheckValid.checkValid(value, typeCheck, context),
          decoration: InputDecoration(
            hintText: "Input Text...",
            filled: true,
            fillColor:
                Theme.of(context).colorScheme.outlineVariant.withOpacity(0.25),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
        ),
      ),
    );
  }
}
