import 'package:chatapp/common/widgets/stateless/bottom_sheet/voice_bottom_sheet.dart';
import 'package:chatapp/common/widgets/stateless/button/custom_outline_icon_button.dart';
import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/assets_picker.dart';
import '../chat_room_bloc/chat_room_bloc.dart';

class RowMediaButton extends StatelessWidget {
  const RowMediaButton({Key? key}) : super(key: key);

  void _pickImage(BuildContext ctx, AppMediaResource type) async {
    final stateChatRoom = ctx.read<ChatRoomBloc>().state;
    if (stateChatRoom is ChatRoomInfoSuccess) {
      String? filePath;
      if (type == AppMediaResource.camera) {
        filePath = await AppAssetsPicker.pickImageFromCamera(ctx);
      } else if (type == AppMediaResource.gallery) {
        filePath = await AppAssetsPicker.pickImageFromGallery(ctx);
      }

      if (filePath != null && ctx.mounted) {
        ctx.read<MessageStreamCubit>().sendMessage(
              type: "image",
              message: filePath,
              receiverUserId: stateChatRoom.user.id,
            );
      }
    }
  }

  void _pickVideo(BuildContext ctx) async {
    final stateChatRoom = ctx.read<ChatRoomBloc>().state;
    if (stateChatRoom is ChatRoomInfoSuccess) {
      final filePath = await AppAssetsPicker.pickVideo(ctx);

      if (filePath != null && ctx.mounted) {
        ctx.read<MessageStreamCubit>().sendMessage(
              type: "video",
              message: filePath,
              receiverUserId: stateChatRoom.user.id,
            );
      }
    }
  }

  void _pickRecord(BuildContext ctx) async {
    final stateChatRoom = ctx.read<ChatRoomBloc>().state;
    if (stateChatRoom is ChatRoomInfoSuccess) {
      await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: ctx,
        builder: ((context) {
          return const VoiceSoundBottomSheet();
        }),
      ).then((value) {
        if (value != null) {
          ctx.read<MessageStreamCubit>().sendMessage(
                type: "audio",
                message: value,
                receiverUserId: stateChatRoom.user.id,
              );
        }
      });
    }
  }

  void _pickFile(BuildContext ctx) async {
    final stateChatRoom = ctx.read<ChatRoomBloc>().state;
    if (stateChatRoom is ChatRoomInfoSuccess) {
      String? filePath = await AppAssetsPicker.pickFile(ctx);

      if (filePath != null && ctx.mounted) {
        ctx.read<MessageStreamCubit>().sendMessage(
              type: "file",
              message: filePath,
              receiverUserId: stateChatRoom.user.id,
            );
      }
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
            title: AppLocalizations.of(context)!.camera,
            onPress: () => _pickImage(context, AppMediaResource.camera),
          ),
          COutlineIconButton(
            icon: Icons.image_outlined,
            color: Colors.cyan,
            title: AppLocalizations.of(context)!.gallery,
            onPress: () => _pickImage(context, AppMediaResource.gallery),
          ),
          COutlineIconButton(
            icon: Icons.video_collection_outlined,
            color: Colors.deepPurple,
            title: AppLocalizations.of(context)!.video,
            onPress: () => _pickVideo(context),
          ),
          COutlineIconButton(
            icon: Icons.mic_outlined,
            title: AppLocalizations.of(context)!.voice,
            onPress: () => _pickRecord(context),
          ),
          COutlineIconButton(
            icon: Icons.attach_file_outlined,
            color: Colors.pink,
            title: AppLocalizations.of(context)!.files,
            onPress: () => _pickFile(context),
          ),
          COutlineIconButton(
            icon: Icons.emoji_emotions_outlined,
            color: Colors.orange,
            title: AppLocalizations.of(context)!.sticker,
            onPress: () {},
          ),
          COutlineIconButton(
            icon: Icons.location_on_outlined,
            color: Colors.green,
            title: AppLocalizations.of(context)!.location,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
