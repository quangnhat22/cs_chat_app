import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../message_item.dart';

class SystemMessageItem extends IMessageItem {
  const SystemMessageItem({
    super.key,
    this.content,
    this.nameActor,
  });

  final String? content;
  final String? nameActor;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300]?.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[400]!)),
      child: Text(
        '${nameActor ?? ''} ${convertSystemString(context, content ?? '')}',
        style: TextStyle(
          fontSize: 14.sp,
          //fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static String convertSystemString(BuildContext ctx, String content) {
    switch (content) {
      case "group-created":
        {
          return AppLocalizations.of(ctx)!.group_created;
        }
      case "member-joined":
        {
          return AppLocalizations.of(ctx)!.member_joined;
        }
      case "member-leaved":
        {
          return AppLocalizations.of(ctx)!.member_leaved;
        }
      case "removedFromRoom":
        {
          return "were removed";
        }
      case "leftRoom":
        {
          return "left room";
        }
      default:
        {
          return content;
        }
    }
  }
}
