import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/presentation/group/list_member_group/cubit/list_member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMemberItem extends StatelessWidget {
  const ListMemberItem({
    super.key,
    required this.id,
    this.email,
    this.avatar,
    this.name,
  });

  final String id;
  final String? name;
  final String? email;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ListMemberCubit>().tapMemberGroup(id);
      },
      child: ListTile(
        title: Text(name ?? ""),
        subtitle: Text(email ?? ""),
        leading: CustomAvatarImage(
          urlImage: avatar,
          maxRadiusEmptyImg: 20,
          widthImage: 48,
          heightImage: 48,
        ),
      ),
    );
  }
}
