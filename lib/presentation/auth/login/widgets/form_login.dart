part of login;

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: AppScreenUtils.isLandscape() ? 1.sh : 0.75.sh,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                const InputLoginEmail(),
                const InputPassword(),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: ForgotPasswordTextButton(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: ButtonSignIn(),
                ),
                DividerWithText(text: AppLocalizations.of(context)!.or),
                const LoginWithGoogleButton(),
                const Padding(
                  padding: EdgeInsets.only(top: 36.0),
                  child: TextButtonSignUp(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
