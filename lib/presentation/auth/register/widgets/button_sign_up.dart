part of register;

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({
    super.key,
  });

  void _onTapSignUpBtn(BuildContext ctx) {
    ctx.read<SignUpCubit>().signUpFormSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.inProgress) {
          return const CircularProgressIndicator();
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                AppLocalizations.of(context)!.create_your_new_account,
                state.isValid ? () => _onTapSignUpBtn(context) : null,
                state.isValid
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
            ),
          );
        }
      },
    );
  }
}
