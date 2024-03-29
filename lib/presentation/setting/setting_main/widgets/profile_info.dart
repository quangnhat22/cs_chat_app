part of setting_main;

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingMainCubit, SettingMainState>(
      buildWhen: (previous, current) =>
          previous.avatar != current.avatar ||
          previous.name != current.name ||
          previous.email != current.email,
      builder: (context, state) {
        return state.when(initial: ((avatar, name, email, _, __, ___) {
          return Column(
            children: <Widget>[
              CustomAvatarImage(
                maxRadiusEmptyImg: 64,
                widthImage: 120,
                heightImage: 120,
                urlImage: avatar,
              ),
              const SizedBox(
                height: 12,
              ),
              name != null
                  ? Text(
                      name,
                      style: AppTextStyles.authHeadTitleTextStyle,
                    )
                  : Container(),
              const SizedBox(
                height: 12,
              ),
              email != null
                  ? Text(
                      email,
                      style: AppTextStyles.captionTextStyle,
                    )
                  : Container(),
            ],
          );
        }));
      },
    );
  }
}
