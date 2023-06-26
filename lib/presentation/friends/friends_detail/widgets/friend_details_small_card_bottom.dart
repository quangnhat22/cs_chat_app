import 'package:chatapp/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/presentation/friends/friends_detail/cubit/friend_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/ink_well/ink_well_dynamic_border.dart';

class FriendDetailsSmallCardBottom extends StatelessWidget {
  const FriendDetailsSmallCardBottom({super.key});

  void _handleSeeProfile(BuildContext ctx) async {
    await ctx.read<FriendDetailCubit>().tappedFriendCard();
  }

  void _handleSeeMedia(BuildContext ctx) {
    String? chatRoomId = ctx.read<FriendDetailCubit>().state.chatRoomId;
    if (chatRoomId == null) return;
    NavigationUtil.pushNamed(route: RouteName.medias, args: chatRoomId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            InkWellDynamicBorder(
              title: AppLocalizations.of(context)!.see_profile,
              leading: const Icon(Icons.person_outline),
              onTap: () => _handleSeeProfile(context),
              hasTopBorderRadius: true,
              hasBottomBorderRadius: false,
            ),
            const DividerSpaceLeft(),
            InkWellDynamicBorder(
              title: AppLocalizations.of(context)!.view_photos_and_media_files,
              leading: const Icon(Icons.photo_library),
              onTap: () => _handleSeeMedia(context),
              hasTopBorderRadius: false,
              hasBottomBorderRadius: true,
            ),
            // const DividerSpaceLeft(),
            // InkWellDynamicBorder(
            //   title: AppLocalizations.of(context)!.delete_friend,
            //   leading: const Icon(Icons.delete),
            //   // onTap: () {},
            //   hasTopBorderRadius: false,
            //   hasBottomBorderRadius: true,
            // ),
          ],
        ),
      ),
    );
  }
}
