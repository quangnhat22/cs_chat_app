part of forgot_password;

class GoBackTextButton extends StatelessWidget {
  const GoBackTextButton({
    Key? key,
    required this.applyText,
  }) : super(key: key);

  void _handleGoBack(BuildContext ctx) {
    Navigator.pop(ctx);
  }

  final String applyText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => _handleGoBack(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 35, top: 32),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
