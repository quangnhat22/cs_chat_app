import 'package:chatapp/common/widgets/stateless/button/custom_outline_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: <Widget>[
          COutlineIconButton(
            icon: Icons.camera_alt_outlined,
            color: Colors.blue,
            title: "Camera",
            onPress: () {},
          ),
          COutlineIconButton(
            icon: Icons.image_outlined,
            color: Colors.cyan,
            title: "Gallery",
            onPress: () {},
          ),
          COutlineIconButton(
            icon: Icons.video_collection_outlined,
            color: Colors.deepPurple,
            title: "Video",
            onPress: () {},
          ),
          COutlineIconButton(
            icon: Icons.mic_outlined,
            title: "Voice",
            onPress: () {},
          ),
          COutlineIconButton(
            icon: Icons.emoji_emotions_outlined,
            color: Colors.orange,
            title: "Sticker",
            onPress: () {},
          ),
          COutlineIconButton(
            icon: Icons.location_on_outlined,
            color: Colors.green,
            title: "Location",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
