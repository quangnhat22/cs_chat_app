part of edit_profile;

class InputFullName extends StatelessWidget {
  const InputFullName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return CTextFormField(
          icon: const Icon(Icons.badge_outlined),
          label: AppLocalizations.of(context)!.full_name,
          initVal: state.name,
          errorText: AppCheckValid.checkValid(
            state.name,
            TypeValueCheck.text,
            context,
          ),
          onChanged: (value) {
            context.read<EditProfileFormCubit>().fullnameChanged(value);
          },
        );
      },
    );
  }
}
