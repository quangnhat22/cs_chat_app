import 'package:flutter/material.dart';

class InkWellDynamicBorder extends StatelessWidget {
  const InkWellDynamicBorder({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
    this.onTap,
    this.hasTopBorderRadius = false,
    this.hasBottomBorderRadius = false,
    this.radius = 10.0,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool hasTopBorderRadius;
  final bool hasBottomBorderRadius;
  final double? radius;

  Radius _isNeedToTopRadius() {
    return hasTopBorderRadius ? Radius.circular(radius ?? 10) : Radius.zero;
  }

  Radius _isNeedToBottomRadius() {
    return hasBottomBorderRadius ? Radius.circular(radius ?? 10) : Radius.zero;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: _isNeedToTopRadius(),
          topRight: _isNeedToTopRadius(),
          bottomLeft: _isNeedToBottomRadius(),
          bottomRight: _isNeedToBottomRadius(),
        ),
      ),
      onTap: onTap,
      child: ListTile(
        leading: leading,
        title: Text(title),
        trailing: trailing,
      ),
    );
  }
}
