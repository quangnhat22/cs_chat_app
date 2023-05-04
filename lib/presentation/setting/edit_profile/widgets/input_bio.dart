part of edit_profile;

class InputBio extends StatefulWidget {
  const InputBio({super.key});

  @override
  State<InputBio> createState() => _InputBioState();
}

class _InputBioState extends State<InputBio> {
  final _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      controller: _bioController,
      icon: const Icon(Icons.help_outline),
      label: AppLocalizations.of(context)!.bio,
      type: InputType.multiline,
    );
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }
}
