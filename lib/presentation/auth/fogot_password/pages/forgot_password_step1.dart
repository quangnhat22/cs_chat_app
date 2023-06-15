part of forgot_password;

class ForgotPasswordPage extends StatelessWidget {
  final String? urlCode;

  const ForgotPasswordPage({super.key, this.urlCode});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GoBackTextButton(
                applyText: urlCode ?? "",
              ),
              Text(urlCode ?? ""),
              const ValidateEmailForm(),
            ],
          ),
        ),
      ),
    );
  }
}
