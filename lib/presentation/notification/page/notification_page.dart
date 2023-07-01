part of notifications_lib;

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NotificationBloc>()..add(const NotificationEvent.started()),
      child: const NotificationView(),
    );
  }
}

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  void _deleteAllNotification(BuildContext ctx) {
    final state = ctx.read<NotificationBloc>().state;
    if (state is GetListNotificationInSuccess) {
      if (state.listNotification.isEmpty) {
        SnackBarApp.showSnackBar(
            null, AppLocalizations.of(ctx)!.noti_empty, TypesSnackBar.warning);
      } else {
        AppDefaultDialogWidget()
            .setAppDialogType(AppDialogType.confirm)
            .setTitle(AppLocalizations.of(ctx)!.delete_noti)
            .setContent(AppLocalizations.of(ctx)!.do_you_want_reject_friend)
            .setNegativeText(AppLocalizations.of(ctx)!.cancel)
            .setPositiveText(AppLocalizations.of(ctx)!.confirm)
            .setOnPositive(() {
              ctx.read<NotificationBloc>().add(const ListNotificationDeleted());
              Navigator.of(ctx).pop();
            })
            .setOnNegative(() {
              Navigator.of(ctx).pop();
            })
            .buildDialog(ctx)
            .show(ctx);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.notifications,
        actionButton: IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Theme.of(context).colorScheme.error,
          ),
          onPressed: () => _deleteAllNotification(context),
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          NotificationList(),
        ],
      ),
    );
  }
}
