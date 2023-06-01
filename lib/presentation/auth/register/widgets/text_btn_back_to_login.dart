part of register;

class TextButtonBackToLogin extends StatelessWidget {
  const TextButtonBackToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: CustomTextButton(
        AppLocalizations.of(context)!.back_to_login,
        () {
          Navigator.pop(context);
        },
        Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
