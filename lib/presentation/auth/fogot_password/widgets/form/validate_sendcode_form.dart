part of forgot_password;

class ValidateSendCodeForm extends StatefulWidget {
  const ValidateSendCodeForm({super.key});

  @override
  State<ValidateSendCodeForm> createState() => _ValidateSendCodeFormState();
}

class _ValidateSendCodeFormState extends State<ValidateSendCodeForm> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: 
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.CSChat,
            Padding(
              padding: const EdgeInsets.only(top: 75, left: 17, right: 17),
              child: Text(
                "We have just send reset code to email@domain.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.darkColorScheme.outline,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  BuildSquare(message: "1",),
                  BuildSquare(message: "2",),
                  BuildSquare(message: "3",),
                  BuildSquare(message: "4",),
              ]),),
            const Padding(
              padding: EdgeInsets.only(top: 47),
              child: SendCodeAgainTextButton(),),
            const Padding(
              padding: EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 54),
              child: SendButton(applyText: "Confirm",),)
          ],
        ))
      );
  }
}

