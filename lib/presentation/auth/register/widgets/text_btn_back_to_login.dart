part of register;

class TextButtonBackToLogin extends StatelessWidget {
  const TextButtonBackToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: CustomTextButton(
        buttonText: AppLocalizations.of(context)!.return_login,
        onPressed: () {
          Navigator.pop(context);
        },
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
