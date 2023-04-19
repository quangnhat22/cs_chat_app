part of register;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthFormCard(
      childWidget: Form(
        key: _formKey,
        child: Column(children: [
          EmailTextFormField(emailController),
          PasswordTextFormField(controller: passwordController),
          PasswordTextFormField(
            controller: rePasswordController,
            label: AppLocalizations.of(context)!.confirm_password,
          ),
          Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: const SignUpButton(),
          ),
        ]),
      ),
    );
  }
}
