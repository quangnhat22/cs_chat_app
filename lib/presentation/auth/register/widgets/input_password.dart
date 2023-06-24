part of register;

class InputPassword extends StatelessWidget {
  const InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CPasswordTextField(
          key: const Key('signUpForm_passwordInput_textField'),
          label: AppLocalizations.of(context)!.password,
          onChange: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          errorText: state.password.displayError != null
              ? state.password.error?.message
              : null,
        );
      },
    );
  }
}
