import 'package:chatapp/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class COutlineIconButton extends StatelessWidget {
  const COutlineIconButton({
    Key? key,
    this.icon,
    required this.title,
    this.color = Colors.red,
    this.onPress,
  }) : super(key: key);

  final IconData? icon;
  final String title;
  final VoidCallback? onPress;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            backgroundColor: color.withOpacity(0.1),
            foregroundColor: color,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPress,
          child: Column(
            children: [
              Icon(
                icon,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          title,
          style: AppTextStyles.captionTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
