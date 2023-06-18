part of your_groups;

class ListGroupItem extends StatelessWidget {
  const ListGroupItem({
    super.key,
    required this.groupItem,
  });

  final GroupEntity groupItem;

  void _onTapGroupMessage() {
    NavigationUtil.pushNamed(
        route: RouteName.groupChatRoom, args: groupItem.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        NavigationUtil.pushNamed(route: RouteName.groupDetails);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          title: Text(
            groupItem.name ?? "",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          leading: CustomAvatarImage(
            urlImage: groupItem.imageUrl,
            widthImage: 48,
            heightImage: 48,
          ),
          trailing: IconButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: _onTapGroupMessage,
            icon: const Icon(Icons.message_outlined),
          ),
        ),
      ),
    );
  }
}
