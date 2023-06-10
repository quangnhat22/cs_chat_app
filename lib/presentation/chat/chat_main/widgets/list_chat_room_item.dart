import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:chatapp/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListChatRoomItem extends StatelessWidget {
  const ListChatRoomItem({
    super.key,
    this.name,
    this.lastestMessage,
    this.time,
    this.avatar,
    this.isMessageRead = false,
  });

  final String? name;
  final String? lastestMessage;
  final String? avatar;
  final String? time;
  final bool isMessageRead;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const CustomAvatarImage(
                        urlImage:
                            "https://t3.ftcdn.net/jpg/02/43/51/48/360_F_243514868_XDIMJHNNJYKLRST05XnnTj0MBpC4hdT5.jpg",
                        widthImage: 48,
                        heightImage: 48,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                name ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                lastestMessage ?? "",
                                // style: TextStyle(
                                //     fontSize: 13,
                                //     color: Colors.grey.shade600,
                                //     fontWeight: widget.isMessageRead
                                //         ? FontWeight.bold
                                //         : FontWeight.normal),
                                style: AppTextStyles.captionTextStyle,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      time ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            isMessageRead ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Icon(
                        Icons.check_outlined,
                        color: Colors.green,
                        size: 14.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const DividerSpaceLeft(),
        ],
      ),
    );
  }
}
