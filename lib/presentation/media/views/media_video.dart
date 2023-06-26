import 'package:chatapp/common/widgets/stateless/message/message_item/video_message_item.dart';
import 'package:chatapp/presentation/media/cubit/media_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/stateless/skeleton/list_skeleton.dart';

class MediaVideo extends StatelessWidget {
  const MediaVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        return state.maybeWhen(
          getListMessageSuccess: (listPhotos, listVideo, listFile, listLink) {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0),
              itemBuilder: (BuildContext s, int index) {
                return VideoMessageItem(
                  content: listVideo?[index].message,
                  videoUrl: listVideo?[index].videoUrl,
                  isBorder: false,
                );
              },
              itemCount: listVideo?.length ?? 0,
            );
          },
          orElse: () => const ListSkeleton(),
        );
      },
    );
  }
}
