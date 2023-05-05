part of edit_profile;

class DialogGender extends StatefulWidget {
  const DialogGender({
    Key? key,
    required this.initGender,
  }) : super(key: key);

  final AppGender initGender;

  @override
  State<DialogGender> createState() => _DialogGenderState();
}

class _DialogGenderState extends State<DialogGender> {
  late AppGender _selectGender;

  @override
  void initState() {
    _selectGender = widget.initGender;
    super.initState();
  }

  void _handleChangeRadioValue(String value) {
    if (value == AppGender.male.value) {
      _handleChangeGender(AppGender.male);
    } else if (value == AppGender.female.value) {
      _handleChangeGender(AppGender.female);
    } else {
      _handleChangeGender(AppGender.others);
    }
  }

  void _handleChangeGender(AppGender gender) {
    setState(() {
      _selectGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(_selectGender);
        return Future.value(true);
      },
      child: AlertDialog(
        title: const Text('Select Gender'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CRadioListTile(
              value: AppGender.male.value,
              groupValue: _selectGender.value,
              onChanged: _handleChangeRadioValue,
            ),
            CRadioListTile(
              value: AppGender.female.value,
              groupValue: _selectGender.value,
              onChanged: _handleChangeRadioValue,
            ),
            CRadioListTile(
              value: AppGender.others.value,
              groupValue: _selectGender.value,
              onChanged: _handleChangeRadioValue,
            ),
          ],
        ),
      ),
    );
  }
}
