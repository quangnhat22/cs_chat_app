part of edit_profile;

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: const <Widget>[
            InputFullName(),
            InputPhoneNumber(),
            InputBirthday(),
            InputGender(),
            InputBio(),
            BtnEditProfile(),
          ],
        ),
      ),
    );
  }
}
