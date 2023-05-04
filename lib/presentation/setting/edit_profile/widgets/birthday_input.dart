part of edit_profile;

class BirthdayInput extends StatefulWidget {
  final TextEditingController controller;

  const BirthdayInput({super.key, required this.controller});

  @override
  State<BirthdayInput> createState() => _BirthdayInputState();
}

class _BirthdayInputState extends State<BirthdayInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          label: Text(AppLocalizations.of(context)!.birthday),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              widget.controller.text = formattedDate;
            });
          } else {
            log("Date is not selected");
          }
        },
      ),
    );
  }
}
