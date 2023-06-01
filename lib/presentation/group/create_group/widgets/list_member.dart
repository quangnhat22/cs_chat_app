import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart';
import 'package:chatapp/presentation/group/create_group/widgets/list_member_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMember extends StatelessWidget {
  const ListMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListMemberItem(
              isValue: true,
              user: state.friends[index],
            );
          },
          itemCount: state.friends.length,
        );
      },
    );
  }
}
