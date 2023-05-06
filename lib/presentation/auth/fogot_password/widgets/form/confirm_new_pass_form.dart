part of forgot_password;

class ValidateNewPassword extends StatefulWidget {
  const ValidateNewPassword({super.key});

  @override
  State<ValidateNewPassword> createState() => _ValidateNewPasswordState();
}

class _ValidateNewPasswordState extends State<ValidateNewPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.csChat,
            const Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                "Enter New Password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: PasswordTextFormField(
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: PasswordTextFormField(
                controller: confirmPasswordController,
                label: "Confirm password",
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 54),
              child: SendButton(
                applyText: "Confirm",
              ),
            )
          ],
        )));
  }
}
