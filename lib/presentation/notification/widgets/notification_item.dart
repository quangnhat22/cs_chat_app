import 'package:chatapp/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/domain/entities/notification_entity.dart';
import 'package:chatapp/presentation/notification/bloc/notification_bloc.dart';
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

  void _handleOnTapAccept(BuildContext ctx, String type) {
    ctx.read<NotificationBloc>().add(NotifcationTapped(
        type: type, actionType: type, isAccept: true, id: noti.prep!.id));
  }

  void _handleOnTapReject(BuildContext ctx, String type) {
    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_reject_friend)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
          ctx.read<NotificationBloc>().add(NotifcationTapped(
              type: type,
              actionType: type,
              isAccept: false,
              id: noti.prep!.id));
          Navigator.of(ctx).pop();
        })
        .buildDialog(ctx)
        .show(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext ctx) {
              ctx
                  .read<NotificationBloc>()
                  .add(NotificationDeletedById(id: noti.id));
            },
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
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
                    color: Theme.of(context).colorScheme.onBackground),
                children: <TextSpan>[
              TextSpan(
                text: noti.subject?.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: noti.action == 'accept-request'
                    ? " accept your request"
                    : AppLocalizations.of(context)!.want_to_friend_with_you,
                style: const TextStyle(fontWeight: FontWeight.w300),
              )
            ])),
        leading: CustomAvatarImage(
          urlImage: noti.subject?.image,
          widthImage: 48,
          heightImage: 48,
        ),
        subtitle: (noti.action != 'accept-request' && noti.action != null)
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Wrap(
                  spacing: 20,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () =>
                          _handleOnTapReject(context, noti.action!),
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 30))),
                      child: Text(AppLocalizations.of(context)!.reject_request),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          padding: const EdgeInsets.symmetric(horizontal: 30)),
                      onPressed: () =>
                          _handleOnTapAccept(context, noti.action!),
                      child: Text(AppLocalizations.of(context)!.accept_request),
                    )
                  ],
                ),
              )
            : Container(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      ),
    );
  }
}
