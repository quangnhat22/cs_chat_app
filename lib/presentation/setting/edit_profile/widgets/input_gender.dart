part of edit_profile;

class InputGender extends StatefulWidget {
  const InputGender({super.key});

  @override
  State<InputGender> createState() => _InputGenderState();
}

class _InputGenderState extends State<InputGender> {
  final TextEditingController genderController = TextEditingController();

  Future<void> _showDialog(BuildContext ctx, AppGender currentGender) {
    return showDialog(
      context: ctx,
      builder: (context) => DialogGender(
        initGender: currentGender,
      ),
    ).then((gender) {
      setState(() {
        genderController.text = (gender as AppGender).value;
      });
      ctx.read<EditProfileFormCubit>().genderChanged(gender);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextFormField(
            controller: genderController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.people_outline),
              suffixIcon: const Icon(Icons.expand_more_outlined),
              label: Text(AppLocalizations.of(context)!.select_gender),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            readOnly: true,
            onTap: () => _showDialog(context, state.gender),
          ),
        );
      },
    );
  }
}
