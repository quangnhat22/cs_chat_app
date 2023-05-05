part of register;

class SettingPhotoPage extends StatelessWidget {
  const SettingPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const GoBackTextButton(applyText: "Back to Register",),
            AuthHeader(
              title: "Add a photo",
              subTitle: "Add a profile photos so your friends know it's you",
              mainColor: Theme.of(context).colorScheme.primary,
            ),
            PhotoHighFormCard(
              childWidget: Column(
                children: [ 
                  Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 180,),
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightColorScheme.surfaceVariant,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 125,
                          color: AppColors.lightColorScheme.outline,
                        ),
                      ),
                    )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 160, bottom: 20),
                    child: Center(child: SendButton(applyText: "Choose a photo",),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Center(child: SendButton(applyText: "Maybe later",),),
                  ) 

                ] ,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
