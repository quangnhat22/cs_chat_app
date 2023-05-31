part of login;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<AppBloc>().add(AppUserChanged());
          },
          failure: (message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingPage(),
          orElse: () {
            return Scaffold(
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
            );
          },
        );
      },
    );
  }
}
