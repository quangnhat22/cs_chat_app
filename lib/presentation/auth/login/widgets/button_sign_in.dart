part of login;

class ButtonSignIn extends StatelessWidget {
  const ButtonSignIn({super.key});

  void _handleLogin(BuildContext ctx) {
    ctx.read<LoginCubit>().loginFormSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomElevatedButton(
          buttonText: AppLocalizations.of(context)!.sign_in,
          onPressed: state.isValid ? () => _handleLogin(context) : null,
          backgroundColor:
              state.isValid ? Theme.of(context).colorScheme.primary : null,
        );
      },
    );
  }
}
