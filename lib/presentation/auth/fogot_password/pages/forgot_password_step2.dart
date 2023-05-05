part of forgot_password;


class ForgotPasswordPage2 extends StatelessWidget {
  const ForgotPasswordPage2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: const [
                GoBackTextButton(applyText: "Back",),
                ValidateSendCodeForm(),
              ],
          ),
        ),  
        ),
      );
  }
}