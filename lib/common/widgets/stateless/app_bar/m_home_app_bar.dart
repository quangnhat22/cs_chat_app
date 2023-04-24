import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_assets.dart';
import '../../../../core/config/app_text_style.dart';
import '../../../../core/config/app_theme.dart';

class MHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MHomeAppBar({
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
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          radius: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: AppTheme.isDarkTheme()
                ? AppAssets.logoAppLight
                : AppAssets.logoApp,
          ),
        ),
      ),
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
