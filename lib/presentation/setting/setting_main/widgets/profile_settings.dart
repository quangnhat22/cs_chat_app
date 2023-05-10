part of setting_main;

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  void _onPickAvatar(BuildContext ctx) async {
    // final filePath = await AppAssetsPicker.pickSingleAssets(ctx);
    // if (filePath == null) return;
    //
    // log(filePath);
    // if (ctx.mounted) {
    //   ctx.read<SettingMainCubit>().updateAvatar(filePath);
    // }
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return const MenuSelectAvatarResource();
      },
    );
  }

  void _onTapEditProfile() {
    NavigationUtil.pushNamed(route: RouteName.editProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.change_profile_photo,
            leading: const Icon(Icons.add_a_photo_outlined),
            onTap: () => _onPickAvatar(context),
            hasTopBorderRadius: true,
            hasBottomBorderRadius: false,
          ),
          const DividerSpaceLeft(),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.edit_profile,
            leading: const Icon(Icons.account_circle_outlined),
            trailing: const Icon(Icons.chevron_right),
            onTap: _onTapEditProfile,
            hasTopBorderRadius: false,
            hasBottomBorderRadius: false,
          ),
          const DividerSpaceLeft(),
          InkWellDynamicBorder(
            title: AppLocalizations.of(context)!.change_password,
            leading: const Icon(Icons.password_outlined),
            onTap: () {},
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
        ],
      ),
    );
  }
}
