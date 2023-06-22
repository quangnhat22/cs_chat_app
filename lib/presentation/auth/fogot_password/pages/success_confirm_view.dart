part of forgot_password;

class SuccessConfirmView extends StatelessWidget {
  const SuccessConfirmView({super.key, this.changePage});

  final Function? changePage;

  void _returnStepOne() {
    changePage!(0);
  }

  void _openGmailApp() async {
    await LaunchApp.openApp(
      androidPackageName: 'com.google.android.gm',
      iosUrlScheme: 'googlegmail://',
      // appStoreLink:
      // 'itms-apps://itunes.apple.com/app/pulse-secure/id945832041',
      openStore: true,
      // https://apps.apple.com/us/app/gmail-email-by-google/id422689480
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (prev, current) => prev != current,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: GoBackTextButton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppAssets.sendEmailSuccessJpg,
                        Text(
                          AppLocalizations.of(context)!.send_email_success,
                          style: AppTextStyles.headlineTextStyle,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .check_email_forgot_password(state.email.value),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.captionTextStyle.copyWith(
                            height: 1.5,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        CustomElevatedButton(
                          onPressed: _openGmailApp,
                          buttonText:
                              AppLocalizations.of(context)!.open_gmail_app,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextButton(
                          buttonText:
                              AppLocalizations.of(context)!.change_email,
                          onPressed: _returnStepOne,
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
