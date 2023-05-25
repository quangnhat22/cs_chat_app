part of groups_dash_board;

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: GestureDetector(
                  child: const Text(
                    'Team anh em siêu nhơn',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    NavigationUtil.pushNamed(route: RouteName.teamDetails);
                  },
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.group_on_going,
                  style: const TextStyle(color: Colors.green),
                ),
                leading: const CircleAvatar(child: Text('T')),
                trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                        AppLocalizations.of(context)!.group_join_text_button)),
              ),
              if (index != 11) const DividerSpaceLeft()
            ],
          );
        }),
        itemCount: 12,
      ),
    );
  }
}
