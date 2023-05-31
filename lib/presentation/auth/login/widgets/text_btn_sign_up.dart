part of login;

class TextButtonSignUp extends StatelessWidget {
  const TextButtonSignUp({super.key});

  void _handleTapSignUpButton(BuildContext ctx) {
    Navigator.pushNamed(ctx, RouteName.signUpPage);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Center(
        child: RichText(
          text: TextSpan(
            text: "Don't have account? ",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Sign up',
                style: AppTextStyles.textSpanSignUpStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _handleTapSignUpButton(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
