import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';

class FriendDetailsSmallCardBottom extends StatelessWidget {
  const FriendDetailsSmallCardBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.view_photos_and_media_files,
            leading: const Icon(Icons.photo_library),
            // onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.friend_block,
            leading: const Icon(Icons.block),
            // onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.delete_friend,
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