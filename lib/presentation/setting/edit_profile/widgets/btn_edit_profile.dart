part of edit_profile;

class BtnEditProfile extends StatelessWidget {
  const BtnEditProfile({
    super.key,
  });

  void _onPressEditBtn(
    BuildContext ctx,
    String? name,
    PhoneNumber? phone,
    DateTime? birthday,
    AppGender? gender,
    String? bio,
  ) {
    ctx.read<EditFormSubmitBloc>().add(EditFormSubmitted(
          name: name,
          phoneNumber: phone,
          birthday: birthday,
          gender: gender,
          bio: bio,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormSubmitBloc, EditFormSubmitState>(
      builder: (context, EditFormSubmitState formState) {
        return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
          builder: (context, state) {
            return formState.maybeWhen(
              loading: () => const CircularProgressIndicator(),
              orElse: () => Padding(
                padding: const EdgeInsets.only(top: 48),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    buttonText: AppLocalizations.of(context)!.confirm,
                    onPressed: !state.isDone
                        ? null
                        : () => _onPressEditBtn(
                              context,
                              state.name,
                              state.phoneNumber,
                              state.birthday,
                              state.gender,
                              state.bio,
                            ),
                    backgroundColor: !state.isDone
                        ? Colors.grey[400]
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
