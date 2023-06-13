part of login;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return BlocConsumer<LoginCubit, LoginState>(
  //     listenWhen: (prev, current) => prev.statusSubmit != current.statusSubmit,
  //     buildWhen: (prev, current) => prev.statusSubmit != current.statusSubmit,
  //     listener: (context, state) {
  //       if (state.statusSubmit == FormzSubmissionStatus.failure) {
  //         SnackBarApp.showSnackBar(
  //             context, state.errorMessage, TypesSnackBar.error);
  //       }
  //     },
  //     builder: (context, state) {
  //       if (state.statusSubmit == FormzSubmissionStatus.inProgress) {
  //         return const LoadingPage();
  //       } else {
  //         return GestureDetector(
  //           onTap: () {
  //             //hide keyboard when click random on screen
  //             AppScreenUtils.hideInputKeyboard();
  //           },
  //           child: Scaffold(
  //             resizeToAvoidBottomInset: false,
  //             body: SafeArea(
  //               child: Stack(
  //                 fit: StackFit.expand,
  //                 alignment: AlignmentDirectional.bottomCenter,
  //                 children: [
  //                   AuthHeader(
  //                     title: AppLocalizations.of(context)!.sign_in,
  //                     subTitle: AppLocalizations.of(context)!
  //                         .sign_in_your_account_to_see_your_chatting,
  //                     mainColor: Theme.of(context).colorScheme.primary,
  //                   ),
  //                   const FormLogin(),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Row(
                    children: [
                      FloatBackButton(
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: CustomAvatarImage()),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "UIT is the best (K15)",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Hoạt động hôm nay",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextButton(AppLocalizations.of(context)!.change_profile_picture_or_your_name, () { }, Theme.of(context).colorScheme.primary),
                ),
              ]),
            ShortFormCard(
              childWidget: ListGroupDetail(),
        )],
        ),
      ),
    );
  }
}

class ListGroupDetail extends StatelessWidget {
  ListGroupDetail({super.key});

  final details = ["Thêm thành viên", "Bật thông báo", "Xem thành viên", "File, phương tiện", "Rời nhóm"];
  final icons = [
    Icons.add,
    Icons.notifications_active,
    Icons.people,
    Icons.attach_file,
    Icons.exit_to_app,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                icons[index],
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            title: Text(details[index]),
            tileColor: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        );
      },
      itemCount: details.length,
    );
  }
}
