part of your_groups;

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListGroupBloc, ListGroupState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          inSuccess: (listGroup) {
            if (listGroup.isEmpty) {
              return SliverFillRemaining(
                child: RefreshPage(
                    label: AppLocalizations.of(context)!.refresh_page,
                    onRefresh: () {
                      context
                          .read<ListGroupBloc>()
                          .add(const ListGroupEvent.refreshed());
                    }),
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //if (index.isEven) {
                  return Column(
                    children: [
                      ListGroupItem(
                        groupItem: listGroup[index],
                      ),
                      const DividerSpaceLeft(),
                    ],
                  );
                  //}
                  //return
                },
                childCount: listGroup.length,
              ),
            );
          },
          inProgress: () {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          orElse: () {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                    AppLocalizations.of(context)!.something_wrong_try_again),
              ),
            );
          },
        );
      },
    );
  }
}
