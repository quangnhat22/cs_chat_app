import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_member/invite_new_member_cubit.dart';
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_new_member_form/invite_new_member_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/config/app_text_style.dart';
import '../../../../domain/entities/user_entity.dart';

class ListNewMember extends StatefulWidget {
  const ListNewMember({super.key});

  @override
  State<ListNewMember> createState() => _ListNewMemberState();
}

class _ListNewMemberState extends State<ListNewMember> {
  final List<UserEntity?> selectedFriends = [];

  void _inputChange(String value, BuildContext ctx) {
    ctx.read<InviteNewMemberCubit>().inputChanged(value);
  }

  void handleSelectMembers(BuildContext ctx, UserEntity member) {
    ctx.read<InviteNewMemberFormCubit>().groupMembersChanged(member);

    final existingMember = selectedFriends.firstWhere(
      (element) => element?.id == member.id,
      orElse: () => null,
    );
    setState(() {
      if (existingMember == null) {
        selectedFriends.add(member);
      } else {
        selectedFriends.removeWhere((element) => element?.id == member.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: TextField(
            onChanged: (value) => _inputChange(value, context),
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onInverseSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: AppLocalizations.of(context)!.search_friends),
            // onChanged: (value) {
            //   widget.onTextChange(value);
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text(
            '${selectedFriends.length} ${AppLocalizations.of(context)!.selected_text}',
            textAlign: TextAlign.start,
            style: AppTextStyles.mediumTitleTextStyle,
          ),
        ),
        BlocBuilder<InviteNewMemberCubit, InviteNewMemberState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state.getFriendsStatus == GetFriendsStatus.fail) {
              return const Center(
                child: Text('Something wrong'),
              );
            } else if (state.getFriendsStatus == GetFriendsStatus.success) {
              if (state.listMembers == null || state.listMembers!.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.no_friends_found),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final friends = state.displayMembers?[index];
                  return CheckboxListTile(
                    title: Text(
                        friends?.name == null || friends!.name!.trim() == ''
                            ? AppLocalizations.of(context)!.unknown_name
                            : friends.name!),
                    // subtitle: Text(
                    //   AppLocalizations.of(context)!.user_status_online,
                    //   style: const TextStyle(color: Colors.green),
                    // ),
                    secondary: CustomAvatarImage(
                      urlImage: friends?.avatar,
                      widthImage: 24,
                    ),
                    value: selectedFriends.firstWhere(
                          (element) => element?.id == friends!.id,
                          orElse: () => null,
                        ) !=
                        null,
                    onChanged: (bool? value) =>
                        {handleSelectMembers(context, friends!)},
                  );
                },
                itemCount: state.displayMembers?.length ?? 0,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
