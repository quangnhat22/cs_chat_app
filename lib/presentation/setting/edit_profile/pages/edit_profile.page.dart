part of edit_profile;

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<EditProfileFormCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<EditFormSubmitBloc>(),
        ),
      ],
      child: const EditProfileView(),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditFormSubmitBloc, EditFormSubmitState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () => SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.update_profile_success,
              TypesSnackBar.success),
          failure: (_) => SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.update_profile_fail,
              TypesSnackBar.error),
          warning: (warningMessage) => SnackBarApp.showSnackBar(
              context, warningMessage, TypesSnackBar.warning),
        );
      },
      child: Scaffold(
        appBar: MPageAppBar(
          title: AppLocalizations.of(context)!.edit_profile,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: EditProfileForm(),
          ),
        ),
      ),
    );
  }
}
