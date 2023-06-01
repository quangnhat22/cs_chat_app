part of login;

class InputLoginEmail extends StatelessWidget {
  const InputLoginEmail({super.key});

  void _handleOnEmailChanged(BuildContext ctx, String value) {
    ctx.read<LoginCubit>().emailChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CTextFormField(
          key: const Key('signUpForm_emailInput_textField'),
          icon: const Icon(Icons.email_outlined),
          onChange: (email) => _handleOnEmailChanged(context, email),
          label: AppLocalizations.of(context)!.email_label,
          errorText: state.email.displayError != null
              ? state.email.error?.message
              : null,
        );
      },
    );
  }
}
