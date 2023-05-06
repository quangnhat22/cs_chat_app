part of friends_contact;

class ListFriendItem extends StatelessWidget {
  const ListFriendItem({
    super.key,
    required this.id,
    this.email,
    this.avatar,
    this.name,
  });

  final String id;
  final String? name;
  final String? email;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FriendsContactBloc>().add(TapFriendContactCard(id: id));
      },
      child: ListTile(
        title: Text(name ?? ""),
        subtitle: Text(email ?? ""),
        leading: CustomAvatarImage(
          urlImage: avatar,
        ),
        trailing: IconButton(
            onPressed: () {
              NavigationUtil.pushNamed(route: RouteName.chatRoom);
            },
            icon: Icon(
              Icons.comment_outlined,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            )),
      ),
    );
  }
}
