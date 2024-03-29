part of friends_contact;

class ListFriend extends StatelessWidget {
  const ListFriend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsContactBloc, FriendsContactState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          success: (friends) {
            return friends.isEmpty
                ? RefreshPage(
                    label: AppLocalizations.of(context)!.refresh_page,
                    onRefresh: () {
                      context
                          .read<FriendsContactBloc>()
                          .add(const FriendsContactEvent.started());
                    })
                : ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const DividerSpaceLeft(),
                    itemBuilder: (context, index) {
                      return ListFriendItem(
                        id: friends[index].id,
                        name: friends[index].name,
                        avatar: friends[index].avatar,
                        type: "personal",
                        chatRoomId: friends[index].chatRoomId,
                        // chatRoomId: friends[index].chatRoomId,
                      );
                    },
                    itemCount: friends.length,
                  );
          },
          failure: (message) {
            return const Center(
              child: Text("Something wrong! Try again."),
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
