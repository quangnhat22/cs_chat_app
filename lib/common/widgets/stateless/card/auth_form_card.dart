import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/screen_utils.dart';

class AuthFormCard extends StatelessWidget {
  const AuthFormCard({Key? key, required this.childWidget}) : super(key: key);

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: AppScreenUtils.isLandscape() ? 0.7.sh : 0.75.sh,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: childWidget,
        ),
      ),
    );
  }
}
