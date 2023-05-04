part of edit_profile;

class InputBio extends StatelessWidget {
  const InputBio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
      buildWhen: (previous, current) => previous.bio != current.bio,
      builder: (context, state) {
        return CTextFormField(
          icon: const Icon(Icons.help_outline),
          label: AppLocalizations.of(context)!.bio,
          initVal: state.bio,
          // errorText: AppCheckValid.checkValid(
          //   state.name,
          //   TypeValueCheck.text,
          //   context,
          // ),
          onChanged: (value) {
            context.read<EditProfileFormCubit>().bioChanged(value);
          },
        );
      },
    );
  }
}
