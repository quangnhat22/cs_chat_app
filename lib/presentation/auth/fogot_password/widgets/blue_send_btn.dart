part of forgot_password;

class SendButton extends StatelessWidget {
  const SendButton(
    {Key? key,
    required this.applyText}) : super(key: key);

  void _handleSendRequest() {}

  final String applyText;
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      applyText,
      _handleSendRequest,
      Theme.of(context).colorScheme.primary,
    );
  }
}