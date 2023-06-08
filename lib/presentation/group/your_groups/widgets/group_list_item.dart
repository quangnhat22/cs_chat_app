import 'package:chatapp/domain/entities/group_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import '../../../../core/routes/app_navigation.dart';
import '../../../../core/routes/route_name.dart';

class ListGroupItem extends StatelessWidget {
  const ListGroupItem({
    super.key,
    required this.groupItem,
  });

  final GroupEntity groupItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        child: Text(
          groupItem.name ?? "",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        onTap: () {
          NavigationUtil.pushNamed(route: RouteName.teamDetails);
        },
      ),
      subtitle: Text(
        AppLocalizations.of(context)!.group_on_going,
        style: const TextStyle(color: Colors.green),
      ),
      leading: CustomAvatarImage(
        urlImage:
            "https://firebasestorage.googleapis.com/v0/b/cs-chat-app-eac8a.appspot.com/o/TypeFile.images%2F1685613868579159?alt=media&token=dcbbea07-52c7-4b1b-b36b-4ecbe756a020&_gl=1*l076i0*_ga*MTQ5NjYyOTQwNC4xNjg0MjI4Njc2*_ga_CW55HF8NVT*MTY4NjIzOTQ4My42LjEuMTY4NjI0MjI4NS4wLjAuMA..",
        widthImage: 50,
        heightImage: 50,
      ),
      trailing: TextButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.group_join_text_button)),
    );
  }
}
