part of edit_profile;

class InputBirthday extends StatefulWidget {
  const InputBirthday({super.key});

  @override
  State<InputBirthday> createState() => _InputBirthdayState();
}

class _InputBirthdayState extends State<InputBirthday> {
  final TextEditingController _controller = TextEditingController();

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
    return BlocListener<EditProfileFormCubit, EditProfileFormState>(
      listenWhen: (previous, current) => previous.birthday != current.birthday,
      listener: (context, state) {
        if (state.birthday != null) {
          _controller.text = AppDateTimeFormat.formatDDMMYYYY(state.birthday);
          // _controller.selection = TextSelection.fromPosition(
          //     TextPosition(offset: _controller.text.length));
        }
      },
      child: CTextFormField(
        controller: _controller,
        icon: const Icon(Icons.calendar_today),
        label: AppLocalizations.of(context)!.birthday,
        isReadOnly: true,
        onTap: () => _onTapBirthdayInput(context),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
