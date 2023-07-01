part of groups_request;

class ListRequestGroupReceive extends StatelessWidget {
  const ListRequestGroupReceive({super.key, required this.listReceiveRequest});

  final List<GroupRequestEntity> listReceiveRequest;

  void _onRejectRequest(BuildContext ctx, String? receiverId) {
    if (receiverId == null) return;
    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_reject_group)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
          ctx.read<GroupRequestActionCubit>().rejectRequest(receiverId);
          Navigator.of(ctx).pop();
        })
        .buildDialog(ctx)
        .show(ctx);
  }

  void _onAcceptRequest(BuildContext ctx, String? receiverId) {
    if (receiverId == null) return;
    ctx.read<GroupRequestActionCubit>().acceptRequest(receiverId);
  }

  @override
  Widget build(BuildContext context) {
    return (listReceiveRequest.isEmpty)
        ? RefreshPage(
            label: AppLocalizations.of(context)!.didnt_receive_group_request,
            onRefresh: () {
              context
                  .read<ListGroupRequestBloc>()
                  .add(const ListGroupRequestRefreshed());
            })
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    "${listReceiveRequest[index].sender?.name} ${AppLocalizations.of(context)!.invited_you_to_join_group} \"${listReceiveRequest[index].group?.name}\""),
                leading: CustomAvatarImage(
                  urlImage: listReceiveRequest[index].sender?.avatar,
                  maxRadiusEmptyImg: 20,
                  widthImage: 48,
                  heightImage: 48,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(listReceiveRequest[index].createdAt != null
                          ? AppDateTimeFormat.formatDDMMYYYY(
                              listReceiveRequest[index].createdAt)
                          : ""),
                    ),
                    Wrap(
                      spacing: 20,
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: () => _onRejectRequest(
                            context,
                            listReceiveRequest[index].group!.id,
                          ),
                          style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(horizontal: 30))),
                          child: Text(
                              AppLocalizations.of(context)!.reject_request),
                        ),
                        ElevatedButton(
                          onPressed: () => _onAcceptRequest(
                              context, listReceiveRequest[index].group!.id),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30)),
                          child: Text(
                              AppLocalizations.of(context)!.accept_request),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: listReceiveRequest.length,
          );
  }
}
