part of forgot_password;

class SendFormButton extends StatelessWidget {
  const SendFormButton({
    Key? key,
  }) : super(key: key);

  void _tappedBtnSendEmail(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return const SucessConfirmView();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      buttonText: "Send Email",
      onPressed: () => _tappedBtnSendEmail(context),
    );
  }
}
