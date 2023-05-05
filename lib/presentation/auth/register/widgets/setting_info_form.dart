part of register;

class SettingInfoForm extends StatefulWidget {
  const SettingInfoForm({super.key});

  @override
  State<SettingInfoForm> createState() => _SettingInfoFormState();
}

class _SettingInfoFormState extends State<SettingInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AuthFormCard(
      childWidget: Form(
        key: _formKey,
        child: Column(children: [
          Text_Form_Field(
            textformController: usernameController,
            iconData: const Icon(Icons.account_box),
            label: "Username",
            keyboardType1: TextInputType.name
          ),
          Text_Form_Field(
            textformController: fullnameController,
            iconData: const Icon(Icons.person),
            label: "Full name",
            keyboardType1: TextInputType.name,
          ),
          Text_Form_Field(
            textformController: phoneController,
            iconData: const Icon(Icons.phone),
            label: "Phone",
            keyboardType1: TextInputType.phone
          ),
          Text_Form_Field(
            textformController: aboutController,
            iconData: const Icon(Icons.info),
            label: "About",
            keyboardType1: TextInputType.multiline,
            maxLines: 5,),
          Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: const SignUpButton(),
          ),
        ]),
      ),
    );
  }
}
