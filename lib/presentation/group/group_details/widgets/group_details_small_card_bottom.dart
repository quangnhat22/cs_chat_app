import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';

class GroupDetailsSmallCardBottom extends StatelessWidget {
  const GroupDetailsSmallCardBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
           InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.view_members,
            leading: const Icon(Icons.group),
            // onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.view_photos_and_media_files,
            leading: const Icon(Icons.photo_library),
            // onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.exit_group,
            leading: const Icon(Icons.exit_to_app),
            // onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.delete_group,
            leading: const Icon(Icons.delete),
            // onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
        ],
      ),
    );
  }
}