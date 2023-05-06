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
            return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const DividerSpaceLeft(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    NavigationUtil.pushNamed(
                        route: RouteName.friendInfo, args: friends[index]);
                  },
                  child: ListTile(
                    title: Text(friends[index].name ?? ""),
                    subtitle: Text(friends[index].email ?? ""),
                    leading: CustomAvatarImage(
                      urlImage: friends[index].avatar,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment_outlined,
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                        )),
                  ),
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
