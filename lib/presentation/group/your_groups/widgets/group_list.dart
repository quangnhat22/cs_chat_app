import 'package:chatapp/presentation/group/your_groups/bloc/list_group_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'group_list_item.dart';

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListGroupBloc, ListGroupState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          inSuccess: (listGroup) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Column(
                    children: <Widget>[
                      ListGroupItem(
                        groupItem: listGroup[index],
                      ),
                      //if (index != 11) const DividerSpaceLeft()
                    ],
                  );
                }),
                itemCount: listGroup.length,
              ),
            );
          },
          inProgress: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }
}
