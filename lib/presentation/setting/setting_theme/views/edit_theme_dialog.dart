part of setting_theme;

class EditThemeView extends StatelessWidget {
  const EditThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingThemeCubit>(),
      child: const EditThemeDialog(),
    );
  }
}

class EditThemeDialog extends StatelessWidget {
  const EditThemeDialog({super.key});

  void _handleChangeThemeValue(BuildContext ctx, String value) {
    ctx.read<SettingThemeCubit>().appThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingThemeCubit, SettingThemeState>(
      builder: (context, state) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.select_theme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CRadioListTile(
                value: AppThemeEnum.light.value,
                groupValue: state.theme,
                onChanged: (value) => _handleChangeThemeValue(context, value),
              ),
              CRadioListTile(
                value: AppThemeEnum.dark.value,
                groupValue: state.theme,
                onChanged: (value) => _handleChangeThemeValue(context, value),
              ),
              CRadioListTile(
                value: AppThemeEnum.system.value,
                groupValue: state.theme,
                onChanged: (value) => _handleChangeThemeValue(context, value),
              ),
            ],
          ),
        );
      },
    );
  }
}
