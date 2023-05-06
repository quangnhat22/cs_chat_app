import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../message_item.dart';

class TextMessageItem extends IMessageItem {
  const TextMessageItem({
    super.key,
    this.content,
    this.isMe = false,
  });

  final String? content;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: isMe ? _borderMessageRight() : _borderMessageLeft(),
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.6.sw),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isMe ? Theme.of(context).colorScheme.primary : Colors.white,
          borderRadius: isMe ? _borderMessageRight() : _borderMessageLeft(),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        child: Text(
          content ?? '',
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 15.sp,
            height: 1.5,
            //fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  BorderRadius _borderMessageLeft() {
    return const BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
      topRight: Radius.circular(16),
    );
  }

  BorderRadius _borderMessageRight() {
    return const BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    );
  }
}
