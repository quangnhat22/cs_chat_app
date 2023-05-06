import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/app_text_style.dart';
import 'button/float_back_button.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color mainColor;
  final bool isShowBackButton;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.mainColor,
    this.isShowBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
      decoration: BoxDecoration(color: mainColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isShowBackButton
              ? FloatBackButton(
                  Theme.of(context).colorScheme.onPrimary, mainColor)
              : SizedBox(
                  height: 16.h,
                ),
          Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                title,
                style: AppTextStyles.authHeadTitleTextStyle
                    .copyWith(color: Colors.white),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              subTitle,
              style: AppTextStyles.authHeadSubtitleTextStyle
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
