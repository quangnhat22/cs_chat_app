import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/presentation/group/your_groups/bloc/list_group_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../groups_dash_board/groups_dash_board.dart';
import '../widgets/group_list.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownGroupsFilterButton(() {}),
              ],
            ),
          ),
          const GroupList(),
        ],
      ),
    );
  }
}
