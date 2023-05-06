import 'package:chatapp/common/widgets/stateless/button/custom_outline_icon_button.dart';
import 'package:flutter/material.dart';

class RowMediaButton extends StatelessWidget {
  const RowMediaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        COutlineIconButton(
          icon: Icons.emoji_emotions_outlined,
          onPress: () {},
        ),
        COutlineIconButton(
          icon: Icons.image_outlined,
          onPress: () {},
        ),
        COutlineIconButton(
          icon: Icons.video_collection_outlined,
          onPress: () {},
        ),
        COutlineIconButton(
          icon: Icons.mic_outlined,
          onPress: () {},
        ),
      ],
    );
  }
}
