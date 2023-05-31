part of login;

class InputPassword extends StatelessWidget {
  const InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CPasswordTextField(
          key: const Key('signUpForm_passwordInput_textField'),
          label: AppLocalizations.of(context)!.password,
          onChange: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          errorText: state.password.displayError != null
              ? state.password.error?.message
              : null,
        );
      },
    );
  }
}
