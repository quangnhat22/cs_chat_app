part of forgot_password;

class SendFormButton extends StatelessWidget {
  const SendFormButton({
    Key? key,
  }) : super(key: key);

  void _tappedBtnSendEmail(BuildContext ctx) {
    ctx.read<ForgotPasswordCubit>().submitSendEmail();
  }

  @override
  Widget build(BuildContext context) {
    return CountdownButtonSend(
      onPressed: () => _tappedBtnSendEmail(context),
    );
  }
}
