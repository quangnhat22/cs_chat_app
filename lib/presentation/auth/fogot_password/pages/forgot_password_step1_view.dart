part of forgot_password;

class ForgotPasswordVStep1View extends StatelessWidget {
  const ForgotPasswordVStep1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Align(
                alignment: Alignment.topLeft,
                child: GoBackTextButton(),
              ),
              Center(
                child: SingleChildScrollView(
                  child: ValidateEmailForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
