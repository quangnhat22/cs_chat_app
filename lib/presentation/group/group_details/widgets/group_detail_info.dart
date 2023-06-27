import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/common/widgets/stateless/skeleton/skeleton.dart';
import 'package:chatapp/presentation/group/group_details/bloc/group_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupDetaiInfo extends StatelessWidget {
  const GroupDetaiInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailsBloc, GroupDetailsState>(
      builder: (context, state) {
        return state.maybeWhen(
          inSuccess: (groupInfo) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 160,
                    width: 160,
                    child: CustomAvatarImage(
                      urlImage: groupInfo.avatar,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    groupInfo.name ??
                        AppLocalizations.of(context)!.unknown_group,
                    maxLines: 9,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
          orElse: () => Column(
            children: const [
              Skeleton.circle(
                width: 160,
                height: 160,
              ),
              SizedBox(
                height: 16,
              ),
              Skeleton.rectangular(
                width: 160,
                height: 40,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
