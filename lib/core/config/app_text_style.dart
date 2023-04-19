import 'package:flutter/material.dart';

import 'app_font_size.dart';

class AppTextStyles {
  static const TextStyle headlineTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppFontSize.headlineFontSize,
  );

  static const TextStyle mediumTitleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppFontSize.titleFontSize,
  );

  static const TextStyle captionTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  //app bar
  static const TextStyle titleAppBarTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
  );

  static const TextStyle authHeadTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.headlineFontSize,
      color: Colors.white);

  static const TextStyle authHeadSubtitleTextStyle = TextStyle(
    fontSize: AppFontSize.normalFontSize,
    color: Colors.white,
  );

  static const TextStyle textButtonStyle = TextStyle(
    color: Colors.white,
    fontSize: AppFontSize.normalFontSize,
  );

  //using in text span login and send code again
  static final TextStyle textSpanSignUpStyle = TextStyle(
    color: Colors.blue[700],
    fontSize: AppFontSize.normalFontSize,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subTitleGreyText = TextStyle(
    fontSize: AppFontSize.normalFontSize,
    color: Colors.grey,
    fontWeight: FontWeight.w700,
  );
}
