part of login;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (prev, current) => prev.statusSubmit != current.statusSubmit,
      buildWhen: (prev, current) => prev.statusSubmit != current.statusSubmit,
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.failure) {
          SnackBarApp.showSnackBar(
              context, 'Login fail! Try again.', TypesSnackBar.error);
        }
      },
      builder: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.inProgress) {
          return const LoadingPage();
        } else {
          return GestureDetector(
            onTap: () {
              //hide keyboard when click random on screen
              AppScreenUtils.hideInputKeyboard();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    AuthHeader(
                      title: AppLocalizations.of(context)!.sign_in,
                      subTitle: AppLocalizations.of(context)!
                          .sign_in_your_account_to_see_your_chatting,
                      mainColor: Theme.of(context).colorScheme.primary,
                    ),
                    const FormLogin(),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
