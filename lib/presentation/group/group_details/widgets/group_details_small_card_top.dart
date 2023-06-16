import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';

class GroupDetailsSmallCardTop extends StatelessWidget {
  const GroupDetailsSmallCardTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.add_members,
            leading: const Icon(Icons.group_add),
            // onTap: () => _onPickAvatar(context),
            hasTopBorderRadius: true,
            hasBottomBorderRadius: false,
          ),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.turn_on_notification,
            leading: const Icon(Icons.notifications_active),
            trailing: const Icon(Icons.chevron_right),
            // onTap: _onTapEditProfile,
            hasTopBorderRadius: false,
            hasBottomBorderRadius: false,
          ),
        ],
      ),
    );
  }
}