part of forgot_password;

class SendCodeAgainTextButton extends StatelessWidget {
  const SendCodeAgainTextButton({Key? key}) : super(key: key);

  void _handleSendCodeAgain(BuildContext ctx) {} 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => _handleSendCodeAgain(context),
        child: Text(
          "Send code again",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.lightColorScheme.surfaceTint),
        ),
      ),
    );
  }
}
