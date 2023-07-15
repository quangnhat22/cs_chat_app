part of setting_main;

class DeviceSettings extends StatelessWidget {
  const DeviceSettings({Key? key}) : super(key: key);

  Future<void> _onTapLanguageBtn(BuildContext ctx, String currentLang) {
    return _showEditDialog(ctx, const EditLanguageView());
  }

  Future<void> _onTapThemeBtn(BuildContext ctx, String currentTheme) {
    return _showEditDialog(ctx, const EditThemeView());
  }

  Future<void> _showEditDialog(BuildContext ctx, Widget form) {
    return showDialog(
      context: ctx,
      builder: (context) => form,
    ).then((_) {
      ctx.read<SettingMainCubit>().getValueThemeAndLang();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingMainCubit, SettingMainState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: (_, __, ___, isTurnNoti, theme, lang) {
            return Card(
              child: Column(
                children: <Widget>[
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.language,
                    leading: const Icon(Icons.public),
                    trailing: Text(lang),
                    onTap: () => _onTapLanguageBtn(context, lang),
                    hasTopBorderRadius: true,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.theme,
                    leading: const Icon(Icons.brightness_medium_outlined),
                    trailing: Text(theme),
                    onTap: () => _onTapThemeBtn(context, theme),
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  // InkWellDynamicBorder(
                  //   title: AppLocalizations.of(context)!.notifications,
                  //   leading: const Icon(Icons.notifications_outlined),
                  //   trailing: const Icon(Icons.chevron_right),
                  //   onTap: () {},
                  //   hasTopBorderRadius: false,
                  //   hasBottomBorderRadius: false,
                  // ),
                  // SwitchListTile(
                  //   value: isTurnNoti,
                  //   title: Text(AppLocalizations.of(context)!.notifications),
                  //   secondary: const Icon(Icons.notifications_outlined),
                  //   onChanged: (value) {
                  //     context.read<SettingMainCubit>().changeStatusNoti(value);
                  //   },
                  // ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.devices,
                    leading: const Icon(Icons.devices_outlined),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => {
                      NavigationUtil.pushNamed(
                          route: RouteName.deviceAdministration)
                    },
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: true,
                  ),
                ],
              ),
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
