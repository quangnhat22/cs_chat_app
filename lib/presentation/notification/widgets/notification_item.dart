import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/core/utils/date_time_format.dart';
import 'package:chatapp/domain/entities/notification_entity.dart';
import 'package:chatapp/presentation/notification/bloc/notification_bloc.dart';
import 'package:chatapp/presentation/notification/widgets/notification_request_friend.dart';
import 'package:chatapp/presentation/notification/widgets/notification_request_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.noti,
  });

  final NotificationEntity noti;

  @override
  Widget build(BuildContext context) {
    return noti.action == 'receive-group-request'
        ? NotificationRequestGroup(noti: noti)
        : noti.action == 'receive-friend-request'
            ? NotificationRequestFriend(noti: noti)
            : Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext ctx) {
                        ctx
                            .read<NotificationBloc>()
                            .add(NotificationDeletedById(id: noti.id));
                      },
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      icon: Icons.delete,
                      label: AppLocalizations.of(context)!.delete_noti,
                    ),
                  ],
                ),
                child: ListTile(
                  title: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          children: <TextSpan>[
                        TextSpan(
                          text: noti.subject?.name,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              AppLocalizations.of(context)!.did_accept_request,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        )
                      ])),
                  leading: CustomAvatarImage(
                    urlImage: noti.prep?.image,
                    widthImage: 48,
                    heightImage: 48,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        AppDateTimeFormat.convertToHourMinuteFollowDay(
                          noti.createdAt ?? DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                ),
              );
  }
}
