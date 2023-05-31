part of login;

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({Key? key}) : super(key: key);

  void _handleForgotPassword(BuildContext ctx) {
    Navigator.pushNamed(ctx, RouteName.forgotPasswordPage);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => _handleForgotPassword(context),
        child: Text(
          AppLocalizations.of(context)!.forgot_password,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
