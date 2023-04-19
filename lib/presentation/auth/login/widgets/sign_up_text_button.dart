part of login;

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Center(
        child: RichText(
          text: TextSpan(
            text: "Don't have account? ",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Sign up',
                style: AppTextStyles.textSpanSignUpStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
