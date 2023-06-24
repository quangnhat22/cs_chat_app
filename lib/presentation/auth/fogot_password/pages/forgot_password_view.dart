part of forgot_password;

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.success) {
          AppDefaultDialogWidget()
              .setAppDialogType(AppDialogType.success)
              .setTitle(AppLocalizations.of(context)!.send_email_success)
              .setContent(AppLocalizations.of(context)!
                  .check_email_forgot_password(state.email.value))
              .setPositiveText(AppLocalizations.of(context)!.open_gmail_app)
              .setOnPositive(() async {
                await LaunchApp.openApp(
                  androidPackageName: 'com.google.android.gm',
                  iosUrlScheme: 'googlegmail://',
                  // appStoreLink:
                  // 'itms-apps://itunes.apple.com/app/pulse-secure/id945832041',
                  openStore: true,
                  // https://apps.apple.com/us/app/gmail-email-by-google/id422689480
                );
              })
              .buildDialog(context)
              .show(context);
        } else if (state.statusSubmit == FormzSubmissionStatus.failure) {
          AppDefaultDialogWidget()
              .setAppDialogType(AppDialogType.error)
              .setTitle(AppLocalizations.of(context)!.send_email_fail)
              .buildDialog(context)
              .show(context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: GoBackTextButton(),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: ValidateEmailForm(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
