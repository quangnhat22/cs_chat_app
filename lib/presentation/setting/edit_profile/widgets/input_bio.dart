part of edit_profile;

class InputBio extends StatefulWidget {
  const InputBio({super.key});

  @override
  State<InputBio> createState() => _InputBioState();
}

class _InputBioState extends State<InputBio> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<EditProfileFormCubit>().bioChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileFormCubit, EditProfileFormState>(
      listenWhen: (previous, current) =>
          previous.bio != current.bio && previous.bio == null,
      listener: (context, state) {
        if (state.bio != null) {
          _controller.text = state.bio!;
        }
      },
      child: CTextFormField(
        controller: _controller,
        icon: const Icon(Icons.help_outline),
        label: AppLocalizations.of(context)!.bio,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
