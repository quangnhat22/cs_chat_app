part of setting_language;

class EditLanguageView extends StatelessWidget {
  const EditLanguageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingLanguageCubit>(),
      child: const EditLanguageDialog(),
    );
  }
}

class EditLanguageDialog extends StatelessWidget {
  const EditLanguageDialog({Key? key}) : super(key: key);

  void _handleChangeLanguageValue(BuildContext ctx, String value) {
    ctx.read<SettingLanguageCubit>().appThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingLanguageCubit, SettingLanguageState>(
      builder: (context, state) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.select_language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CRadioListTile(
                value: AppLangEnum.en.value,
                groupValue: state.lang,
                onChanged: (value) =>
                    _handleChangeLanguageValue(context, value),
              ),
              CRadioListTile(
                value: AppLangEnum.vi.value,
                groupValue: state.lang,
                onChanged: (value) =>
                    _handleChangeLanguageValue(context, value),
              ),
              CRadioListTile(
                value: AppLangEnum.system.value,
                groupValue: state.lang,
                onChanged: (value) =>
                    _handleChangeLanguageValue(context, value),
              ),
            ],
          ),
        );
      },
    );
  }
}
