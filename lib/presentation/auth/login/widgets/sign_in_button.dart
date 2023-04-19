part of login;

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  void _handleLogin() {}

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      AppLocalizations.of(context)!.sign_in,
      _handleLogin,
      Theme.of(context).colorScheme.primary,
    );
  }
}
