import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePhotoViews extends StatefulWidget {
  const ImagePhotoViews(
      {super.key, required this.listPhoto, this.currentIndex = 0});

  final List<MessageEntity> listPhoto;
  final int currentIndex;

  @override
  State<ImagePhotoViews> createState() => _ImagePhotoViewsState();
}

class _ImagePhotoViewsState extends State<ImagePhotoViews> {
  late final ExtendedPageController _controller;

  @override
  void initState() {
    _controller = ExtendedPageController(initialPage: widget.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ExtendedImageGesturePageView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = widget.listPhoto[index].message;
            if (item == null) return Container();

            return Stack(
              children: [
                ExtendedImage.network(
                  item,
                  fit: BoxFit.contain,
                  mode: ExtendedImageMode.gesture,
                  clearMemoryCacheWhenDispose: true,
                  // loadStateChanged: (ExtendedImageState state) {
                  //   if (state.extendedImageLoadState == LoadState.completed) {
                  //     return null;
                  //   }
                  //   return ExtendedImage.asset(
                  //     'assets/images/no_data.jpg',
                  //     imageCacheName: 'CropImage',
                  //   );
                  // },
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      child: Text(
                        "${index + 1}/${widget.listPhoto.length}",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16.sp,
                          height: 1.5,
                          //fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: widget.listPhoto.length,
          controller: _controller,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
