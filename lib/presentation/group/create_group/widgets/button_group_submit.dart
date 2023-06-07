import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart';
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonGroupSubmit extends StatelessWidget {
  const ButtonGroupSubmit({
    super.key,
  });

  void _handleOnPress(BuildContext ctx, String groupName, String? groupAvatar) {
    ctx.read<CubitSubmitNewGroupCubit>().createGroup(
        groupName: groupName, groupAvatar: groupAvatar, members: []);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      builder: (context, state) {
        return BlocBuilder<CreateGroupCubit, CreateGroupState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () =>
                  _handleOnPress(context, state.groupName, state.groupImage),
              icon: const Icon(Icons.done),
            );
          },
        );
      },
    );
  }
}
