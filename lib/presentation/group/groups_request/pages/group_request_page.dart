part of groups_request;

enum Request { sent, received }

class GroupRequestPage extends StatelessWidget {
  const GroupRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ListGroupRequestBloc>()
            ..add(const ListGroupRequestEvent.started()),
        ),
        BlocProvider(
          create: (_) => getIt<GroupRequestActionCubit>(),
        ),
      ],
      child: const GroupRequestView(),
    );
  }
}

class GroupRequestView extends StatefulWidget {
  const GroupRequestView({super.key});

  @override
  State<GroupRequestView> createState() => _GroupRequestViewState();
}

class _GroupRequestViewState extends State<GroupRequestView> {
  Request view = Request.sent;

  void handleViewChange(Request selectedView) {
    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupRequestActionCubit, GroupRequestActionState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
            failure: (message) =>
                SnackBarApp.showSnackBar(context, message, TypesSnackBar.error),
            success: () {
              context
                  .read<ListGroupRequestBloc>()
                  .add(const ListGroupRequestRefreshed());
              SnackBarApp.showSnackBar(
                  context, "Success", TypesSnackBar.success);
            });
      },
      child: BlocBuilder<ListGroupRequestBloc, ListGroupRequestState>(
        builder: (context, state) {
          return state.maybeWhen(
            getDataSuccess: (groupRequestSent, groupRequestReceive) {
              return SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<ListGroupRequestBloc>().add(
                        const ListGroupRequestEvent.listRequestRefreshed());
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 16,
                          bottom: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ButtonGroupRequestsSegmented(handleViewChange),
                          ],
                        ),
                      ),
                      view == Request.sent
                          ? ListRequestGroupSend(
                              listSendRequest: groupRequestSent,
                            )
                          : ListRequestGroupReceive(
                              listReceiveRequest: groupRequestReceive,
                            )
                    ],
                  ),
                ),
              );
            },
            getDataFail: (_) {
              return const SomeThingWrong();
            },
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
