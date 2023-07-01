import 'package:chatapp/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/presentation/group/group_details/bloc/group_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';
import '../../../../core/routes/app_navigation.dart';

class GroupDetailsSmallCardBottom extends StatelessWidget {
  const GroupDetailsSmallCardBottom({super.key});

  void _inviteNewMember(BuildContext ctx) {
    final state = ctx.read<GroupDetailsBloc>().state;
    if (state is GetGroupDetailsInSuccess) {
      NavigationUtil.pushNamed(
        route: RouteName.inviteNewMemberGroup,
        args: {
          "groupId": state.groupInfo.id,
          "member": state.groupInfo.members,
        },
      );
    }
  }

  void _handleSeeMemberGroup(BuildContext ctx) {
    final state = ctx.read<GroupDetailsBloc>().state;
    if (state is GetGroupDetailsInSuccess) {
      NavigationUtil.pushNamed(
        route: RouteName.listMemberGroup,
        args: state.groupInfo.members,
      );
    }
  }

  void _handleSeeMedia(BuildContext ctx) {
    final state = ctx.read<GroupDetailsBloc>().state;
    if (state is GetGroupDetailsInSuccess) {
      NavigationUtil.pushNamed(
          route: RouteName.medias, args: state.groupInfo.id);
    }
  }

  void _handleLeaveGroup(BuildContext ctx) {
    final state = ctx.read<GroupDetailsBloc>().state;
    if (state is GetGroupDetailsInSuccess) {
      ctx
          .read<GroupDetailsBloc>()
          .add(GroupDetailsLeaved(id: state.groupInfo.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.add_members,
            leading: const Icon(Icons.group_add_outlined),
            onTap: () => _inviteNewMember(context),
            trailing: const Icon(Icons.chevron_right),
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
          const DividerSpaceLeft(),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.view_members,
            leading: const Icon(Icons.group_outlined),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _handleSeeMemberGroup(context),
            hasTopBorderRadius: false,
            hasBottomBorderRadius: false,
          ),
          const DividerSpaceLeft(),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.view_photos_and_media_files,
            leading: const Icon(Icons.photo_library_outlined),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _handleSeeMedia(context),
            hasTopBorderRadius: false,
            hasBottomBorderRadius: false,
          ),
          const DividerSpaceLeft(),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.exit_group,
            leading: const Icon(Icons.exit_to_app),
            onTap: () => _handleLeaveGroup(context),
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
        ],
      ),
    );
  }
}
