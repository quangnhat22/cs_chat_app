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
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index.isEven) {
                    return ListGroupItem(
                      groupItem: listGroup[index],
                    );
                  }
                  return const DividerSpaceLeft();
                },
                semanticIndexCallback: (Widget widget, int localIndex) {
                  if (localIndex.isEven) {
                    return localIndex ~/ 2;
                  }
                  return null;
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
