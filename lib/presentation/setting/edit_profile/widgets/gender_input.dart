part of edit_profile;

class GenderInput extends StatefulWidget {
  const GenderInput({
    Key? key,
    required this.controller,
    required this.handleChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final Function handleChanged;

  @override
  State<GenderInput> createState() => _GenderInputState();
}

class _GenderInputState extends State<GenderInput> {
  Future<void> _showDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (context) => GenderFormDialog(
        initGender: widget.controller.text,
      ),
    ).then((value) {
      widget.handleChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: widget.controller,
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
        onTap: () => _showDialog(context),
      ),
    );
  }
}
