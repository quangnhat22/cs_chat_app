part of your_groups;

class YourGroupsPage extends StatelessWidget {
  const YourGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ListGroupBloc>()..add(const ListGroupEvent.started()),
      child: const YourGroupsView(),
    );
  }
}

class YourGroupsView extends StatelessWidget {
  const YourGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: CustomScrollView(
          slivers: [
            GroupList(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
        ),
        child: FloatingActionStadiumButton(
          onPressed: () {
            NavigationUtil.pushNamed(route: RouteName.createGroup)
                .then((value) {
              if (value == true) {
                context
                    .read<ListGroupBloc>()
                    .add(const ListGroupEvent.started());
              }
            }).then((value) {
              if (value == true) {
                context
                    .read<ListGroupBloc>()
                    .add(const ListGroupEvent.refreshed());
              }
            });
          },
          heroTag: null,
        ),
      ),
    );
  }
}
