part of friends_infor;

class FriendActions extends StatelessWidget {
  const FriendActions({super.key});

  void _handleAddFriend(BuildContext ctx) {
    final userId = ctx.read<FriendInfoCubit>().state.user.id;
    ctx.read<FriendsActionCubit>().sentAddFriendRequest(userId);
  }

  void _handleDeleteFriend(BuildContext ctx) {
    final userId = ctx.read<FriendInfoCubit>().state.user.id;
    ctx.read<FriendsActionCubit>().deleteFriendRequest(userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendInfoCubit, FriendInfoState>(
      builder: (context, FriendInfoState friendInfoState) {
        return BlocBuilder<FriendsActionCubit, FriendsActionState>(
          buildWhen: (prev, current) => prev != current,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: state.maybeWhen(
                  sentAddRequestInProgress: () =>
                      const CircularProgressIndicator(),
                  orElse: () {
                    return Column(
                      children: [
                        if (friendInfoState.user.relation ==
                            AppFriendRelation.friend.value)
                          ListTile(
                            title: Text(
                              AppLocalizations.of(context)!.friend_unfriend,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                            leading: Icon(
                              Icons.person_remove,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            onTap: () => _handleDeleteFriend(context),
                          ),
                        if (friendInfoState.user.relation ==
                                AppFriendRelation.non.value &&
                            friendInfoState.user.relation !=
                                AppFriendRelation.sent.value &&
                            friendInfoState.user.relation !=
                                AppFriendRelation.received.value)
                          ListTile(
                            title: Text(
                              AppLocalizations.of(context)!.add_friend,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            leading: Icon(
                              Icons.person_add,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            onTap: () => _handleAddFriend(context),
                          ),
                        //const Divider(),
                        // ListTile(
                        //   title: Text(
                        //     AppLocalizations.of(context)!.friend_block,
                        //     style: TextStyle(color: Theme.of(context).colorScheme.error),
                        //   ),
                        //   leading: Icon(
                        //     Icons.block,
                        //     color: Theme.of(context).colorScheme.error,
                        //   ),
                        //   shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.only(
                        //     bottomLeft: Radius.circular(12),
                        //     bottomRight: Radius.circular(12),
                        //   )),
                        //   onTap: () {},
                        // ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
