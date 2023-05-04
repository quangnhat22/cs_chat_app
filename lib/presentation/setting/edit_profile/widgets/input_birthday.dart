part of edit_profile;

class InputBirthday extends StatelessWidget {
  const InputBirthday({super.key});

  void _onTapBirthdayInput(BuildContext ctx) async {
    DateTime? pickedDate = await showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null && ctx.mounted) {
      ctx.read<EditProfileFormCubit>().birthdayChanged(pickedDate);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
      buildWhen: (previous, current) => previous.birthday != current.birthday,
      builder: (context, state) {
        return CTextFormField(
          icon: const Icon(Icons.calendar_today),
          label: AppLocalizations.of(context)!.birthday,
          initVal: AppDateTimeFormat.formatDDMMYYYY(state.birthday),
          isReadOnly: true,
          onTap: () => _onTapBirthdayInput(context),
        );
      },
    );
  }
}
