import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/button/float_back_button.dart';
import '../../../../core/config/app_text_style.dart';

class UpdatePasswordPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const UpdatePasswordPageAppBar({
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
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: FloatBackButton(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          iconColor: Theme.of(context).colorScheme.onPrimary,
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
