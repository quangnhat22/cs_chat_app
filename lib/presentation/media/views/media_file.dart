import 'package:chatapp/common/widgets/stateless/message/message_item/file_message_item.dart';
import 'package:chatapp/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:chatapp/presentation/media/cubit/media_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaFile extends StatelessWidget {
  const MediaFile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        return state.maybeWhen(
          getListMessageSuccess: (listPhotos, listVideo, listFile, listLink) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: FileMessageItem(
                    content: listFile![index].message,
                    isMe: true,
                  ),
                );
              },
              itemCount: listFile?.length ?? 0,
            );
          },
          orElse: () {
            return const Center(
              child: ListSkeleton(),
            );
          },
        );
      },
    );
  }
}
