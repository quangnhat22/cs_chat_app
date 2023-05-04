part of edit_profile;

class InputFullName extends StatefulWidget {
  const InputFullName({super.key});

  @override
  State<InputFullName> createState() => _InputFullNameState();
}

class _InputFullNameState extends State<InputFullName> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<EditProfileFormCubit>().fullnameChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileFormCubit, EditProfileFormState>(
      listenWhen: (previous, current) => previous.name != current.name,
      listener: (context, state) {
        if (state.name != null) {
          _controller.text = state.name!;
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        }
      },
      child: CTextFormField(
        controller: _controller,
        icon: const Icon(Icons.badge_outlined),
        label: AppLocalizations.of(context)!.full_name,
        typeCheck: TypeValueCheck.text,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
