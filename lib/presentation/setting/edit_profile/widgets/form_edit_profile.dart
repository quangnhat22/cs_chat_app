part of edit_profile;

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final birthdayInput = TextEditingController();
  final genderController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> _submitForm(BuildContext ctx) async {
      if (formKey.currentState!.validate()) {
        final message = AppLocalizations.of(ctx)!.please_check_form_again;
        SnackBarApp.showSnackBar(ctx, message, TypesSnackBar.error);
        return;
      } else {
        // await ctx
        //     .read<EditProfileFormCubit>()
        //     .submitEditProfileForm(name: fullNameController.text);
      }
    }

    void handleChangeGender(String value) {
      setState(() {
        genderController.text = value;
      });
    }

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const InputFullName(),
            const InputPhoneNumber(),
            const InputBirthday(),
            const InputGender(),
            const InputBio(),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  AppLocalizations.of(context)!.confirm,
                  () => _submitForm(context),
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    birthdayInput.dispose();
    genderController.dispose();
    super.dispose();
  }
}
