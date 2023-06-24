part of forgot_password;

class ValidateEmailForm extends StatefulWidget {
  const ValidateEmailForm({super.key});

  @override
  State<ValidateEmailForm> createState() => _ValidateEmailFormState();
}

class _ValidateEmailFormState extends State<ValidateEmailForm> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    _emailController.addListener(() {
      context.read<ForgotPasswordCubit>().emailChanged(_emailController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          previous.email != current.email && previous.email.isPure,
      listener: (context, state) {
        if (!state.email.isPure) {
          _emailController.text = state.email.value;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets.csChat,
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text(
                  AppLocalizations.of(context)!.forgot_password,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.dont_worry_password,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.captionTextStyle.copyWith(
                    height: 1.5,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                child: CTextFormField(
                  controller: _emailController,
                  icon: const Icon(Icons.email_outlined),
                  label: AppLocalizations.of(context)!.email_label,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                child: SendFormButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
