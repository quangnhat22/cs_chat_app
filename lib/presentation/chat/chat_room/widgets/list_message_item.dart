import 'package:chatapp/core/config/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/stateless/message/factory_message_item.dart';
import '../../../../core/utils/date_time_format.dart';
import '../../../../domain/entities/message_entity.dart';

class MessgeItem extends StatefulWidget {
  const MessgeItem({
    super.key,
    required this.isMe,
    required this.message,
    this.isSendStatus,
  });

  final bool isMe;
  final MessageEntity message;
  final AppSendMessageStatus? isSendStatus;

  @override
  State<MessgeItem> createState() => _MessgeItemState();
}

class _MessgeItemState extends State<MessgeItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: FactoryMessageItem.buildMessageItem(
            widget.message.id,
            widget.message.type,
            widget.isMe,
            widget.message.message,
            widget.message.videoUrl,
            widget.message.sender?.name ?? "",
            widget.message.createdAt,
          ),
        ),
        if (isTapped)
          Text(
            AppDateTimeFormat.convertToHourMinuteFollowDay(
              widget.message.createdAt ?? DateTime.now(),
            ),
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 8.sp,
              height: 1.5,
              //fontWeight: FontWeight.w300,
            ),
          ),
        if (widget.isSendStatus == AppSendMessageStatus.sending)
          Text(
            "Sending....",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 8.sp,
              height: 1.5,
              //fontWeight: FontWeight.w300,
            ),
          ),
        if (widget.isSendStatus == AppSendMessageStatus.fail)
          Text(
            "Fail! Try again",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.error,
              fontSize: 8.sp,
              height: 1.5,
              //fontWeight: FontWeight.w300,
            ),
          ),
      ],
    );
  }
}
