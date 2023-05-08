import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/date_time_format.dart';
import '../../full_screen_image.dart';
import '../../skeleton/skeleton.dart';
import '../message_item.dart';

class ImageMessageItem extends IMessageItem {
  const ImageMessageItem({
    super.key,
    this.content,
    this.isMe = false,
    this.createdAt,
  });

  final String? content;
  final bool isMe;
  final DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    if (content == null || content == "") {
      return Image.asset("assets/images/image_not_found.jpg");
    }
    return CachedNetworkImage(
      width: 250.w,
      height: 250.h,
      fit: BoxFit.cover,
      imageUrl: content!,
      imageBuilder: (context, imageProvider) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullScreenImage(imageUrl: content!)));
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
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
                      AppDateTimeFormat.convertToHourMinuteFollowDay(
                          createdAt ?? DateTime.now()),
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12.sp,
                        height: 1.5,
                        //fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      placeholder: (context, url) => const Skeleton.rectangular(),
      errorWidget: (context, url, error) {
        return Image.asset("assets/images/image_not_found.jpg");
      },
    );
  }
}
