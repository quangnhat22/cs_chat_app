part of your_groups;

class ListGroupItem extends StatelessWidget {
  const ListGroupItem({
    super.key,
    required this.groupItem,
  });

  final ChatRoomEntity groupItem;

  void _onTapGroupMessage() {
    NavigationUtil.pushNamed(route: RouteName.chatRoom, args: {
      "id": groupItem.id,
      "chatRoomId": groupItem.id,
      "type": groupItem.type,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        NavigationUtil.pushNamed(
            route: RouteName.groupChatRoom, args: groupItem.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          title: Text(
            groupItem.name ?? "",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: (groupItem.latestMessageEntity != null)
              ? Text(
                  "${AppLocalizations.of(context)!.last_message} ${AppDateTimeFormat.convertToHourMinuteFollowDay(groupItem.latestMessageEntity!.createdAt!)}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              : Container(),
          leading: CustomAvatarImage(
            urlImage: groupItem.avatar,
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
