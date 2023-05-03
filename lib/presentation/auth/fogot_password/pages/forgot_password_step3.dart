part of forgot_password;


class ForgotPasswordPage3 extends StatelessWidget {
  const ForgotPasswordPage3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: const [
                GoBackTextButton(applyText: "Back",),
                ValidateNewPassword(),
              ],
          ),
        ),  
        ),
      );
  }
}