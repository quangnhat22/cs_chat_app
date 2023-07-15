import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_member/invite_new_member_cubit.dart';
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_new_member_form/invite_new_member_form_cubit.dart';
import 'package:chatapp/presentation/group/invite_member_group/widgets/button_group_invite_new_member.dart';
import 'package:chatapp/presentation/group/invite_member_group/widgets/list_new_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/di/injector.dart';
import '../../../../domain/entities/user_entity.dart';

class InviteNewMemberPage extends StatelessWidget {
  const InviteNewMemberPage(
      {super.key, required this.listMember, required this.chatRoomId});

  final String chatRoomId;
  final List<UserEntity> listMember;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<InviteNewMemberCubit>()
            ..pageStarted(listMember, chatRoomId),
        ),
        BlocProvider(
          create: (context) => getIt<InviteNewMemberFormCubit>(),
        ),
      ],
      child: const InviteNewMemberView(),
    );
  }
}

class InviteNewMemberView extends StatelessWidget {
  const InviteNewMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InviteNewMemberCubit, InviteNewMemberState>(
      listener: (context, state) {
        if (state.status == InviteNewMemberStatus.success) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.invite_new_member),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () {
              NavigationUtil.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: const [ButtonInviteNewMember()],
        ),
        body: Column(
          children: const <Widget>[
            ListNewMember(),
          ],
        ),
      ),
    );
  }
}
