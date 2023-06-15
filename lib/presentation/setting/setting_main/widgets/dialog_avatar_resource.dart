import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/presentation/setting/setting_main/widgets/avatar_resource_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuSelectAvatarResource extends StatelessWidget {
  const MenuSelectAvatarResource({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AvatarResourceItem(
            icon: Icons.collections_outlined,
            title: AppLocalizations.of(context)!.choose_from_gallery,
            onTap: () {
              Navigator.pop(context, AppMediaResource.gallery);
            },
          ),
          AvatarResourceItem(
            icon: Icons.camera_alt_outlined,
            title: AppLocalizations.of(context)!.take_photo,
            onTap: () {
              Navigator.pop(context, AppMediaResource.camera);
            },
          ),
        ],
      ),
    );
  }
}
