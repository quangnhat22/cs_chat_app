part of register;

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  void _handleLogin() {}

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      AppLocalizations.of(context)!.create_your_new_account,
      _handleLogin,
      Theme.of(context).colorScheme.primary,
    );
  }
}
