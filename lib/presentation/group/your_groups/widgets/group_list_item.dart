part of your_groups;

class ListGroupItem extends StatelessWidget {
  const ListGroupItem({
    super.key,
    required this.groupItem,
  });

  final GroupEntity groupItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        NavigationUtil.pushNamed(route: RouteName.teamDetails);
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
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
          ),
        ),
      ),
    );
  }
}
