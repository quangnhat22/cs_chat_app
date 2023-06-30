import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_member/invite_new_member_cubit.dart';
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_new_member_form/invite_new_member_form_cubit.dart';
import 'package:chatapp/presentation/group/invite_member_group/widgets/list_new_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injector.dart';
import '../../../../domain/entities/user_entity.dart';

class InviteNewMemberPage extends StatelessWidget {
  const InviteNewMemberPage({super.key, required this.listMember});

  final List<UserEntity> listMember;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<InviteNewMemberCubit>()..pageStarted(listMember),
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
    return Scaffold(
      appBar: const MPageAppBar(title: "Invite new member abc"),
      body: Column(
        children: const <Widget>[
          ListNewMember(),
        ],
      ),
    );
  }
}
