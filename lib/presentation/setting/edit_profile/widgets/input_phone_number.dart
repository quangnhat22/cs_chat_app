part of edit_profile;

class InputPhoneNumber extends StatelessWidget {
  const InputPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return CTextFormField(
          icon: const Icon(Icons.phone_outlined),
          label: AppLocalizations.of(context)!.phone_number,
          initVal: state.phoneNumber?.value,
          // errorText: AppCheckValid.checkValid(
          //   state.name,
          //   TypeValueCheck.text,
          //   context,
          // ),
          onChanged: (value) {
            context.read<EditProfileFormCubit>().phoneNumberChanged(value);
          },
        );
      },
    );
  }
}
