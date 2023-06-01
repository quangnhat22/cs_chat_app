import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListMemberItem extends StatelessWidget {
  const ListMemberItem({
    Key? key,
    this.isValue = false,
    this.user,
  }) : super(key: key);

  final bool isValue;
  final UserEntity? user;

  void _onMemberPickChanged(BuildContext ctx) {
    //ctx.read<CreateGroupCubit>().
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(user?.name ?? ""),
      subtitle: Text(
        AppLocalizations.of(context)!.user_status_online,
        style: const TextStyle(color: Colors.green),
      ),
      secondary: CustomAvatarImage(
        urlImage: user?.avatar,
      ),
      value: isValue,
      onChanged: (value) => _onMemberPickChanged(context),
    );
  }
}
