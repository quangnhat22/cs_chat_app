part of forgot_password;

class GoBackTextButton extends StatelessWidget {
  const GoBackTextButton({
    Key? key,
    required this.applyText,
  }) : super(key: key);
  
  void _handleGoBack(BuildContext ctx) {}

  final String applyText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => _handleGoBack(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 35, top: 64 ),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                ),
              Text(
                applyText,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.darkColorScheme.shadow,
                ), 
              ),
            ])) 
    ));
  }
}
