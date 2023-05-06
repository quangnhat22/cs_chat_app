import 'package:chatapp/presentation/chat/chat_room/widgets/button_send_message.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/input_message.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/row_media_buttons.dart';
import 'package:flutter/material.dart';

class FooterChatActions extends StatelessWidget {
  const FooterChatActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.08),
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(16),
          right: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: Theme.of(context).primaryColor.withOpacity(0.08),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (true)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              const Expanded(
                child: InputMessage(),
              ),
              const ButtonSendMessage()
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          if (false) const RowMediaButton(),
        ],
      ),
    );
  }
}
