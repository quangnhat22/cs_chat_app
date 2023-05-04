part of edit_profile;

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({super.key});

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<EditProfileFormCubit>().phoneNumberChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileFormCubit, EditProfileFormState>(
      listenWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber &&
          previous.phoneNumber == null,
      listener: (context, state) {
        if (state.phoneNumber != null) {
          _controller.text = state.phoneNumber?.value ?? "";
        }
      },
      child: CTextFormField(
        controller: _controller,
        icon: const Icon(Icons.phone_outlined),
        label: AppLocalizations.of(context)!.phone_number,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
