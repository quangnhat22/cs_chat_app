part of edit_profile;

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditProfileFormCubit>(),
      child: const EditProfileView(),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MPageAppBar(
            title: AppLocalizations.of(context)!.edit_profile,
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: EditProfileForm(),
            ),
          ),
        );
      },
    );
  }
}
