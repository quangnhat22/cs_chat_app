// import 'package:chatapp/common/widgets/stateless/builder_dialog/app_dialog_base_builder.dart';
// import 'package:chatapp/presentation/notification/bloc/notification_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';

// class NotificationInfoItem extends StatelessWidget {
//   const NotificationInfoItem({
//     super.key,
//     this.nameActor,
//     this.typeAction,
//   });

//   final String? image;
//   final String? nameActor;
//   final String? typeAction;

//   void _handleOnTapAccept(BuildContext ctx, String type) {
//     ctx.read<NotificationBloc>().add(NotifcationTapped(
//         type: type, actionType: type, isAccept: true, id: noti.prep!.id));
//   }

//   void _handleOnTapReject(BuildContext ctx, String type) {
//     AppDefaultDialogWidget()
//         .setAppDialogType(AppDialogType.confirm)
//         .setTitle(AppLocalizations.of(ctx)!.confirm)
//         .setContent(AppLocalizations.of(ctx)!.do_you_want_reject_friend)
//         .setNegativeText(AppLocalizations.of(ctx)!.cancel)
//         .setPositiveText(AppLocalizations.of(ctx)!.confirm)
//         .setOnPositive(() {
//           ctx.read<NotificationBloc>().add(NotifcationTapped(
//               type: type,
//               actionType: type,
//               isAccept: false,
//               id: noti.prep!.id));
//           Navigator.of(ctx).pop();
//         })
//         .buildDialog(ctx)
//         .show(ctx);
//   }

//   String _buildText(String typeAction) {
//     if (typeAction == "accept-request") {
//       return ' accept your request';
//     }
//     return 'request';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: RichText(
//           text: TextSpan(
//               style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).colorScheme.onBackground),
//               children: <TextSpan>[
//             TextSpan(
//               text: nameActor,
//               style: const TextStyle(fontWeight: FontWeight.w600),
//             ),
//             TextSpan(
//               text: _buildText(typeAction ?? ''),
//               style: const TextStyle(fontWeight: FontWeight.w300),
//             )
//           ])),
//       leading: CustomAvatarImage(
//         urlImage: image,
//         widthImage: 48,
//         heightImage: 48,
//       ),
//       subtitle: (typeAction != 'accept-request' && typeAction != null)
//           ? Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: Wrap(
//                 spacing: 20,
//                 children: <Widget>[
//                   OutlinedButton(
//                     onPressed: () => _handleOnTapReject(context, noti.action!),
//                     style: const ButtonStyle(
//                         padding: MaterialStatePropertyAll(
//                             EdgeInsets.symmetric(horizontal: 30))),
//                     child: Text(AppLocalizations.of(context)!.reject_request),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Theme.of(context).colorScheme.primary,
//                         foregroundColor:
//                             Theme.of(context).colorScheme.onSecondary,
//                         padding: const EdgeInsets.symmetric(horizontal: 30)),
//                     onPressed: () => _handleOnTapAccept(context, noti.action!),
//                     child: Text(AppLocalizations.of(context)!.accept_request),
//                   )
//                 ],
//               ),
//             )
//           : Container(),
//       contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
//     );
//   }
// }
