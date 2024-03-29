import 'package:flutter/material.dart';

import '../../../../core/config/app_text_style.dart';

class MPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MPageAppBar({
    super.key,
    required this.title,
    this.bottomWidget,
    this.numberNotification = 0,
  });

  final String title;
  final PreferredSizeWidget? bottomWidget;
  final int numberNotification;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.titleAppBarTextStyle,
      ),
      bottom: bottomWidget,
    );
  }

  @override
  Size get preferredSize {
    if (bottomWidget != null) {
      return const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
    } else {
      return const Size.fromHeight(kToolbarHeight);
    }
  }
}
