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
                ? const EmptyView()
                : ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const DividerSpaceLeft(),
                    itemBuilder: (context, index) {
                      return ListFriendItem(
                        id: friends[index].id,
                        name: friends[index].name,
                        avatar: friends[index].avatar,
                        type: friends[index].type,
                        chatRoomId: friends[index].chatRoomId,
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
