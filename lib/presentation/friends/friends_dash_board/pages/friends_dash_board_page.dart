part of friends_dash_board;

class FriendsDashBoardPage extends StatefulWidget {
  const FriendsDashBoardPage({Key? key}) : super(key: key);

  @override
  State<FriendsDashBoardPage> createState() => _FriendsDashBoardPageState();
}

class _FriendsDashBoardPageState extends State<FriendsDashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  Widget? _bottomButtons() {
    if (_tabController.index == 0) {
      return FloatingActionButton(
        onPressed: () {
          NavigationUtil.pushNamed(route: RouteName.findFriend);
        },
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: const StadiumBorder(),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.friends,
          bottomWidget: TabBar(controller: _tabController, tabs: [
            Tab(
              child: Text(AppLocalizations.of(context)!.contact),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)!.friend_request),
            )
          ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            FriendsContactPage(),
            FriendsRequestPage(),
          ],
        ),
        floatingActionButton: _bottomButtons(),
      ),
    );
  }
}
