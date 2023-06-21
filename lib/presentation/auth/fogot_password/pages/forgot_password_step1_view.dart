part of forgot_password;

class ForgotPasswordVStep1View extends StatelessWidget {
  const ForgotPasswordVStep1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FloatBackButton(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  iconColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const Center(
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
