import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/presentation/group/group_details/bloc/group_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';

class GroupDetailsSmallCardTop extends StatelessWidget {
  const GroupDetailsSmallCardTop({super.key});

  void _editGroupInfo(BuildContext ctx) {
    final groupDetailState = ctx.read<GroupDetailsBloc>().state;
    if (groupDetailState is GetGroupDetailsInSuccess) {
      final groupInfo = groupDetailState.groupInfo;
      NavigationUtil.pushNamed(route: RouteName.editGroup, args: {
        "groupId": groupInfo.id,
        "groupName": groupInfo.name,
        "groupAvatar": groupInfo.avatar
      }).then((isUpdate) {
        if (isUpdate == true && ctx.mounted) {
          ctx.read<GroupDetailsBloc>().add(const GroupDetailsRefreshed());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!
                .change_profile_picture_or_your_name,
            leading: const Icon(Icons.group_add),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _editGroupInfo(context),
            hasTopBorderRadius: true,
            hasBottomBorderRadius: false,
          ),
        ],
      ),
    );
  }
}
