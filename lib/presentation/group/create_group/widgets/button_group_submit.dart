import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart';
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonGroupSubmit extends StatelessWidget {
  const ButtonGroupSubmit({
    super.key,
  });

  void _handleOnPress(BuildContext ctx) {
    final createGroupBloc = ctx.read<CreateGroupCubit>().state;
    if (createGroupBloc.groupName.isNotEmpty &&
        createGroupBloc.groupName.trim() != '') {
      ctx.read<CubitSubmitNewGroupCubit>().createGroup(
            groupName: createGroupBloc.groupName.trim(),
            groupAvatar: createGroupBloc.groupImage ?? '',
            members: createGroupBloc.members,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitSubmitNewGroupCubit, CubitSubmitNewGroupState>(
      builder: (context, state) {
        return state.maybeWhen(
          submitInProgress: () => const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: CircularProgressIndicator(),
          ),
          orElse: () {
            return IconButton(
              onPressed: () => _handleOnPress(context),
              icon: const Icon(Icons.done),
            );
          },
        );
      },
    );
  }
}
