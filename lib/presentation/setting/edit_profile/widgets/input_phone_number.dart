part of edit_profile;

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({super.key});

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    if (mounted) {
      _phoneNumberController.addListener(() {
        context
            .read<EditProfileFormCubit>()
            .fullnameChanged(_phoneNumberController.text);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      controller: _phoneNumberController,
      icon: const Icon(Icons.phone_outlined),
      label: AppLocalizations.of(context)!.phone_number,
      type: InputType.phoneNumber,
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}
