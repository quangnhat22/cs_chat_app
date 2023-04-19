import 'package:flutter/material.dart';

import '../../../core/config/app_text_style.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color mainColor;

  const AuthHeader(this.title, this.subTitle, this.mainColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
      decoration: BoxDecoration(color: mainColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //FloatBackButton(Theme.of(context).colorScheme.onPrimary, mainColor),
        Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              title,
              style: AppTextStyles.authHeadTitleTextStyle,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            subTitle,
            style: AppTextStyles.authHeadSubtitleTextStyle,
          ),
        )
      ]),
    );
  }
}
