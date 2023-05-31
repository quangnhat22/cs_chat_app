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
          AppLocalizations.of(context)!.sign_in,
          state.isValid ? () => _handleLogin(context) : null,
          state.isValid ? Theme.of(context).colorScheme.primary : Colors.grey,
        );
      },
    );
  }
}
