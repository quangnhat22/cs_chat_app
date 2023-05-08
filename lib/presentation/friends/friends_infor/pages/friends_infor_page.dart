part of friends_infor;

class FriendsInforPage extends StatelessWidget {
  const FriendsInforPage({super.key, required this.userInfo});

  final UserEntity userInfo;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FriendInfoCubit>()..pageInited(userInfo),
        ),
        BlocProvider(
          create: (_) => getIt<FriendsActionCubit>(),
        ),
      ],
      child: const FriendsInfoView(),
    );
  }
}

class FriendsInfoView extends StatelessWidget {
  const FriendsInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<FriendsActionCubit, FriendsActionState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          sentAddRequestFailure: (message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
          sentAddRequestSuccess: () {
            SnackBarApp.showSnackBar(
                context,
                AppLocalizations.of(context)!.send_success,
                TypesSnackBar.success);
            NavigationUtil.pushNamedAndRemoveUntil(route: RouteName.homePage);
          },
        );
      },
      child: Scaffold(
        appBar: MPageAppBar(
          title: AppLocalizations.of(context)!.friends,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              FriendMutualInfor(),
              FriendDetailsInfor(),
              FriendActions()
            ],
          ),
        ),
      ),
    );
  }
}
