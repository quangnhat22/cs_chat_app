import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_member/invite_new_member_cubit.dart';
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_new_member_form/invite_new_member_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonInviteNewMember extends StatelessWidget {
  const ButtonInviteNewMember({
    super.key,
  });

  void _handleOnPress(BuildContext ctx) {
    final friendsSelected =
        ctx.read<InviteNewMemberFormCubit>().state.newMember;
    if (friendsSelected.isNotEmpty) {
      ctx
          .read<InviteNewMemberCubit>()
          .inviteNewMemberSubmitted(friendsSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InviteNewMemberCubit, InviteNewMemberState>(
      builder: (context, state) {
        if (state.status == InviteNewMemberStatus.inProgress) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: CircularProgressIndicator(),
          );
        }
        return IconButton(
          onPressed: () => _handleOnPress(context),
          icon: const Icon(Icons.done),
        );
      },
    );
  }
}
