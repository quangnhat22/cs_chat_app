part of forgot_password;

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              GoBackTextButton(
                applyText: "Back to Login",
              ),
              ValidateEmailForm(),
            ],
          ),
        ),
      ),
    );
  }
}
