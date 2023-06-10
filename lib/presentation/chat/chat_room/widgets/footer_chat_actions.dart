import 'package:chatapp/presentation/chat/chat_room/widgets/button_send_message.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/input_message.dart';
import 'package:chatapp/presentation/chat/chat_room/widgets/row_media_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterChatActions extends StatefulWidget {
  const FooterChatActions({Key? key}) : super(key: key);

  @override
  State<FooterChatActions> createState() => _FooterChatActionsState();
}

class _FooterChatActionsState extends State<FooterChatActions> {
  bool _isShowMenu = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (true)
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isShowMenu = !_isShowMenu;
                    });
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 28.sp,
                  ),
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
          if (_isShowMenu) const RowMediaButton(),
        ],
      ),
    );
  }
}
