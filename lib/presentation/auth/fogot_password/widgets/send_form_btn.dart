part of forgot_password;

class SendFormButton extends StatelessWidget {
  const SendFormButton({
    Key? key,
  }) : super(key: key);

  void _tappedBtnSendEmail(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return const SuccessConfirmView();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return CustomElevatedButton(
    //   buttonText: "Send Email",
    //   onPressed: () => _tappedBtnSendEmail(context),
    // );
    return CountdownButtonSend(
      onPressed: () => _tappedBtnSendEmail(context),
    );
  }
}
