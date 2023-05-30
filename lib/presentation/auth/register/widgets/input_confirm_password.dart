part of register;

class InputConfirmPassword extends StatelessWidget {
  const InputConfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return CPasswordTextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChange: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          label: AppLocalizations.of(context)!.confirm_password,
          errorText: state.confirmedPassword.displayError != null
              ? state.confirmedPassword.error?.message
              : null,
        );
      },
    );
  }
}
