import 'package:chatapp/common/widgets/stateless/message/message_item/image_message_item.dart';
import 'package:chatapp/common/widgets/stateless/skeleton/list_skeleton.dart';
import 'package:chatapp/presentation/media/cubit/media_cubit.dart';
import 'package:chatapp/presentation/media/widgets/image_photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaPhoto extends StatelessWidget {
  const MediaPhoto({super.key});

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
                return ImageMessageItem(
                  isBorder: false,
                  createdAt: listPhotos?[index].createdAt,
                  onTap: () {
                    if (listPhotos == null) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagePhotoViews(
                          listPhoto: listPhotos,
                          currentIndex: index,
                        ),
                      ),
                    );
                  },
                  content: listPhotos?[index].message,
                );
              },
              itemCount: listPhotos?.length ?? 0,
            );
          },
          orElse: () => const ListSkeleton(),
        );
      },
    );
  }
}
