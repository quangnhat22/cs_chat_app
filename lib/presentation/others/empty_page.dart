import 'package:flutter/material.dart';

import '../../core/config/app_assets.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppAssets.noDataImg,
      ],
    );
  }
}
