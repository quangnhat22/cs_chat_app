part of login;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
