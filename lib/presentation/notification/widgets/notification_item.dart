import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/domain/entities/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.noti,
  });

  final NotificationEntity noti;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
          text: TextSpan(
              style: const TextStyle(fontSize: 16),
              children: <TextSpan>[
            TextSpan(
              text: noti.subject?.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: AppLocalizations.of(context)!.want_to_friend_with_you,
              style: const TextStyle(fontWeight: FontWeight.w300),
            )
          ])),
      leading: CustomAvatarImage(
        urlImage: noti.subject?.image,
        widthImage: 48,
        heightImage: 48,
      ),
      subtitle: (noti.action != 'accept-request')
          ? Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(
                spacing: 20,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30))),
                    child: Text(AppLocalizations.of(context)!.reject_request),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        padding: const EdgeInsets.symmetric(horizontal: 30)),
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.accept_request),
                  )
                ],
              ),
            )
          : Container(),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    );
  }
}
