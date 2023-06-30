import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/presentation/group/list_member_group/cubit/list_member_cubit.dart';
import 'package:chatapp/presentation/group/list_member_group/widget/list_member_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListMemberGroupPage extends StatelessWidget {
  const ListMemberGroupPage({super.key, required this.listMember});

  final List<UserEntity> listMember;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ListMemberCubit>()..pageStarted(listMember),
      child: const ListMemberGroupView(),
    );
  }
}

class ListMemberGroupView extends StatelessWidget {
  const ListMemberGroupView({super.key});

  void _inputChange(String value, BuildContext ctx) {
    ctx.read<ListMemberCubit>().searchInputChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListMemberCubit, ListMemberState>(
      builder: (context, state) {
        return Scaffold(
          appBar:
              MPageAppBar(title: AppLocalizations.of(context)!.view_members),
          body: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  onChanged: (value) => _inputChange(value, context),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      label: Text(AppLocalizations.of(context)!.group_name)),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final friend = state.listMemberDisplay![index];
                  return ListMemberItem(
                    id: friend.id,
                    name: friend.name,
                    avatar: friend.avatar,
                  );
                },
                itemCount: state.listMemberDisplay?.length ?? 0,
              )
            ],
          ),
        );
      },
    );
  }
}
