part of notifications_lib;

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return state.maybeWhen(
          getListInSuccess: (listNoti) {
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
              child: Center(
                child: Text(
                    AppLocalizations.of(context)!.something_wrong_try_again),
              ),
            );
          },
          getListFail: (message) => Text(message ?? ''),
        );
      },
    );
  }
}
