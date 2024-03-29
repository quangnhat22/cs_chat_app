part of setting_main;

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  void _onTapLogOutButton(BuildContext ctx) {
    // AppDialog.showConfirmDialog(
    //   ctx,
    //   AppLocalizations.of(ctx)!.log_out,
    //   AppLocalizations.of(ctx)!.are_you_sure_want_to_log_out,
    //   () {
    //     Navigator.of(ctx).pop();
    //   },
    //   () {
    //     ctx.read<SettingMainCubit>().onTapLogOutBtn();
    //   },
    // );
    AppDefaultDialogWidget()
        .setTitle(AppLocalizations.of(ctx)!.log_out)
        .setAppDialogType(AppDialogType.confirm)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setOnPositive(() {
          ctx.read<SettingMainCubit>().onTapLogOutBtn();
        })
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .buildDialog(ctx)
        .show(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return CustomOutlineIconButton(
      labelText: AppLocalizations.of(context)!.log_out,
      icon: const Icon(Icons.login_outlined),
      color: Theme.of(context).colorScheme.error,
      handleOnClickButton: () => _onTapLogOutButton(context),
    );
  }
}
