part of setting_main;

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  void _onPickAvatar(BuildContext ctx) async {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return const MenuSelectAvatarResource();
      },
    ).then((value) async {
      if (value == null) return;
      String? filePath;
      if (value == AppMediaResource.camera) {
        filePath = await AppAssetsPicker.pickImageFromCamera(ctx);
      } else {
        filePath = await AppAssetsPicker.pickImageFromGallery(ctx);
      }
      if (filePath == null) return;
      if (ctx.mounted) {
        ctx.read<SettingMainCubit>().updateAvatar(filePath);
      }
    });
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
            trailing: const Icon(Icons.chevron_right),
            onTap: () => {
              NavigationUtil.pushNamed(route: RouteName.updatePassword),
            },
            hasTopBorderRadius: false,
            hasBottomBorderRadius: true,
          ),
        ],
      ),
    );
  }
}
