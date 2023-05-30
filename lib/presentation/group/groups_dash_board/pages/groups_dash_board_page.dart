part of groups_dash_board;

class GroupsDashBoardPage extends StatefulWidget {
  const GroupsDashBoardPage({super.key});

  @override
  State<GroupsDashBoardPage> createState() => _GroupsDashBoardPageState();
}

class _GroupsDashBoardPageState extends State<GroupsDashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.groups,
        bottomWidget: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(AppLocalizations.of(context)!.your_groups),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)!.group_request),
            )
          ],
        ),
      )),
    );
  }
}
