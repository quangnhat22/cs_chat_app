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
        urlImage: groupItem.imageUrl,
        widthImage: 50,
        heightImage: 50,
      ),
      trailing: TextButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.group_join_text_button)),
    );
  }
}
