part of register;

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: AppScreenUtils.isLandscape() ? 1.sh : 0.7.sh,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                const InputEmail(),
                const InputPassword(),
                const InputConfirmPassword(),
                const ButtonSignUp(),
                if (AppScreenUtils.isLandscape()) const TextButtonBackToLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
