part of create_group;

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => getIt<CreateGroupCubit>(),
      ),
      BlocProvider(
        create: (_) => getIt<CubitSubmitNewGroupCubit>(),
      )
    ], child: const CreateGroupView());
  }
}

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitSubmitNewGroupCubit, CubitSubmitNewGroupState>(
      listener: (context, state) {
        state.whenOrNull(submitSuccess: () {
          SnackBarApp.showSnackBar(
              context, "Create group success", TypesSnackBar.success);
          NavigationUtil.pop(result: true);
        }, submitFailed: (message) {
          SnackBarApp.showSnackBar(
              context, "Create group failed", TypesSnackBar.error);
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.create_group_app_bar_title),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () {
              NavigationUtil.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: const [
            ButtonGroupSubmit(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const GroupSetPhoto(),
              const InputGroupName(),
              GroupAddMembers(),
            ],
          ),
        ),
      ),
    );
  }
}
