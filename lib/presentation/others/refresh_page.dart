import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage({
    super.key,
    required this.label,
    required this.onRefresh,
  });

  final String label;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 24.h,
        ),
        Text(
          label,
        ),
        SizedBox(
          height: 24.h,
        ),
        IconButton(
          onPressed: onRefresh,
          icon: const Icon(
            Icons.refresh,
          ),
        )
      ],
    );
  }
}
