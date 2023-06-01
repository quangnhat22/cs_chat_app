import 'package:chatapp/common/widgets/stateless/button/custom_outline_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat_room_bloc/chat_room_bloc.dart';

class RowMediaButton extends StatelessWidget {
  const RowMediaButton({Key? key}) : super(key: key);

  void _sendImageMessage(BuildContext ctx) async {
    final stateChatRoom = ctx.read<ChatRoomBloc>().state;
    if (stateChatRoom is ChatRoomInfoSuccess) {
      final receiverUserId = stateChatRoom.user.id;
      //final filePath = await AppAssetsPicker.pickSingleAssets(ctx);
      // if (filePath == null) return;
      // if (ctx.mounted) {
      //   ctx
      //       .read<MessageStreamCubit>()
      //       .sendMessage("image", filePath, receiverUserId);
      // }
    }
  }

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
          onPress: () => _sendImageMessage(context),
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
