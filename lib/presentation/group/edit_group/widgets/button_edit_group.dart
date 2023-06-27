import 'package:chatapp/presentation/group/edit_group/cubit/edit_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonEditGroup extends StatelessWidget {
  const ButtonEditGroup({super.key});

  void _handleOnPress(BuildContext ctx) async {
    await ctx.read<EditGroupCubit>().updateGroup();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditGroupCubit, EditGroupState>(
      builder: (context, state) {
        if (state.status == EditGroupSubmitStatus.inProgress) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: CircularProgressIndicator(),
          );
        } else {
          return IconButton(
            onPressed: () => _handleOnPress(context),
            icon: const Icon(Icons.done),
          );
        }
      },
    );
  }
}
