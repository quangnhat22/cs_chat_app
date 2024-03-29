part of login;

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({
    Key? key,
    this.widthBtn,
  }) : super(key: key);

  void _handleOnTapBtn(BuildContext ctx) {
    ctx.read<LoginCubit>().loginWithGoogle();
  }

  final double? widthBtn;

  @override
  Widget build(BuildContext context) {
    return CustomOutlineIconButton(
      labelText: AppLocalizations.of(context)!.sign_in_with_google,
      icon: AppAssets.logoGoogle,
      widthBtn: widthBtn,
      handleOnClickButton: () => _handleOnTapBtn(context),
    );
  }
}
