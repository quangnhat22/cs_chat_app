part of login;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleForgotPassword() {
    //Navigator.pushNamed(context, RouteName.forgotPasswordPage);
  }

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      /**
       * Validate user account with controllers
       */
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormCard(
      childWidget: Form(
        key: _formKey,
        child: Column(children: [
          EmailTextFormField(emailController),
          PasswordTextFormField(controller: passwordController),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ForgotPasswordTextButton(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: SignInButton(),
          ),
          DividerWithText(text: AppLocalizations.of(context)!.or),
          const LoginWithGoogleButton(),
          const Padding(
            padding: EdgeInsets.only(top: 36.0),
            child: SignUpTextButton(),
          ),
        ]),
      ),
    );
  }
}
