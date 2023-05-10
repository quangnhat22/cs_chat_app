import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';

class AvatarResourceItem extends StatelessWidget {
  const AvatarResourceItem({
    Key? key,
    required this.title,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final VoidCallbackAction? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWellDynamicBorder(
      leading: CircleAvatar(
        radius: 18.sp,
        child: Icon(icon),
      ),
      title: title,
      onTap: () => onTap,
      hasBottomBorderRadius: true,
      hasTopBorderRadius: true,
      radius: 16,
    );
  }
}
