part of register;

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignUpCubit>(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (prev, current) => prev != current,
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.failure) {
          SnackBarApp.showSnackBar(
            context,
            state.errorMessage,
            TypesSnackBar.error,
          );
        }
        if (state.statusSubmit == FormzSubmissionStatus.success) {
          SnackBarApp.showSnackBar(
            context,
            AppLocalizations.of(context)!.create_your_new_account_success,
            TypesSnackBar.success,
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AuthHeader(
                title: AppLocalizations.of(context)!.sign_up,
                subTitle: AppLocalizations.of(context)!
                    .sign_in_your_account_to_see_your_chatting,
                mainColor: Theme.of(context).colorScheme.primary,
                isShowBackButton: true,
              ),
              const FormSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
