import 'package:chatapp/common/widgets/stateless/app_bar/m_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';

class SettingMainPage extends StatelessWidget {
  const SettingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingMainView();
  }
}

class SettingMainView extends StatelessWidget {
  const SettingMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(title: AppLocalizations.of(context)!.setting),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 32.h,
                ),
                const CustomAvatarImage(
                  maxRadiusEmptyImg: 64,
                ),
                SizedBox(
                  height: 16.h,
                ),
                //const ProfileSettings(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
