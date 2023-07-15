part of notifications_lib;

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return state.maybeWhen(
          getListInSuccess: (listNoti) {
            if (listNoti.isEmpty) {
              return SliverFillRemaining(
                child: RefreshPage(
                    label: AppLocalizations.of(context)!.refresh_page,
                    onRefresh: () {
                      context
                          .read<NotificationBloc>()
                          .add(const NotificationRefreshed());
                    }),
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //if (index.isEven) {
                  return NotificationItem(noti: listNoti[index]);
                  //}
                  //return const DividerSpaceLeft();
                },
                childCount: listNoti.length,
              ),
            );
          },
          getListInProgress: () {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          orElse: () {
            return SliverFillRemaining(
              child: RefreshPage(
                  label: AppLocalizations.of(context)!.notification_refresh,
                  onRefresh: () {
                    context
                        .read<NotificationBloc>()
                        .add(const NotificationRefreshed());
                  }),
            );
          },
          getListFail: (message) => Text(message ?? ''),
        );
      },
    );
  }
}
