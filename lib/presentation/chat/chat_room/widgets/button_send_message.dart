import 'package:flutter/material.dart';

class ButtonSendMessage extends StatelessWidget {
  const ButtonSendMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.send_rounded));
  }
}
