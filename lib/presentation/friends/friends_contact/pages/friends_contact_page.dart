part of friends_contact;

class FriendsContactPage extends StatelessWidget {
  const FriendsContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const DividerSpaceLeft(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              NavigationUtil.pushNamed(route: RouteName.friendInfo);
            },
            child: ListTile(
              title: const Text('Trần Đình Khôi'),
              subtitle: const Text("Online"),
              leading: const CircleAvatar(
                child: Text('K'),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment_outlined,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  )),
            ),
          );
        },
        itemCount: 12,
      ),
    );
  }
}
