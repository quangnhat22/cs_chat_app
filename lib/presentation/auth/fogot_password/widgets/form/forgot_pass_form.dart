part of forgot_password;

class ValidateEmailForm extends StatefulWidget {
  const ValidateEmailForm({super.key});

  @override
  State<ValidateEmailForm> createState() => _ValidateEmailFormState();
}

class _ValidateEmailFormState extends State<ValidateEmailForm> {
  final emailController = TextEditingController();

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
                "Forgot Password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 17, right: 17),
              child: Text(
                "Don’t worry! Just type in your email and we will send you a email to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.darkColorScheme.outline,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 44, left: 20, right: 20),
              child: EmailTextFormField(emailController),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 54),
              child: SendButton(
                applyText: "Send email",
              ),
            )
          ],
        )));
  }
}
