part of register;


class RegisterConfirmPage extends StatelessWidget {
  const RegisterConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: AppScreenUtils.isLandscape() ? 40 : 117),  
              decoration: BoxDecoration(color: AppColors.lightColorScheme.tertiary),
              child: Center(
                child: Column(
                  children: [
                    AppAssets.checkIcon,
                    Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 33),
                      decoration: BoxDecoration(
                        color: AppColors.lightColorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(20),),
                      child: Text(
                        "Awesome !",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.lightColorScheme.tertiary,
                        ),),
                    ),
                  ]),
              ),
            ),
            ShortFormCard(
              childWidget: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, ),
                    child: Text(
                      "Your account created successfully !!!",
                      style: TextStyle(
                        color: AppColors.lightColorScheme.tertiary,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                  ),),
                  const Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 90),
                    child: Center(child: SendButton(applyText: "Go to chat",),),
                  ) 
                ],
              ),
        )],
        ),
      ),
    );
  }
}