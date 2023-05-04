import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/ink_well/ink_well_dynamic_border.dart';
import '../../../../common/widgets/stateless/divider/divider_space_left.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.change_profile_photo,
            leading: const Icon(Icons.add_a_photo_outlined),
            onTap: () {},
            hasTopBorderRadius: true,
            hasBottomBorderRadius: false,
          ),
          const DividerSpaceLeft(),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.edit_profile,
            leading: const Icon(Icons.account_circle_outlined),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: false,
          ),
          const DividerSpaceLeft(),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.change_password,
            leading: const Icon(Icons.password_outlined),
            onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
        ],
      ),
    );
  }
}
