part of groups_request;

class ListRequestGroupSend extends StatelessWidget {
  const ListRequestGroupSend({super.key, required this.listSendRequest});

  final List<GroupRequestEntity> listSendRequest;

  void _onTapRecallButton(BuildContext ctx, String? friendId, String? groupId) {
    if (groupId == null) return;
    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_revoke_group)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
          ctx
              .read<GroupRequestActionCubit>()
              .recallRequest(groupId, friendId ?? "");
          Navigator.of(ctx).pop();
        })
        .buildDialog(ctx)
        .show(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return listSendRequest.isEmpty
        ? RefreshPage(
            label: AppLocalizations.of(context)!.didnt_send_group_request,
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
                  "${listSendRequest[index].receiver?.name} ${AppLocalizations.of(context)!.is_invited_to_join} ${listSendRequest[index].group?.name}",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  listSendRequest[index].createdAt != null
                      ? AppDateTimeFormat.formatDDMMYYYY(
                          listSendRequest[index].createdAt)
                      : "",
                ),
                leading: CustomAvatarImage(
                  urlImage: listSendRequest[index].receiver?.avatar,
                  maxRadiusEmptyImg: 20,
                  widthImage: 48,
                  heightImage: 48,
                ),
                trailing: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    onPressed: () => _onTapRecallButton(
                      context,
                      listSendRequest[index].receiver?.id,
                      listSendRequest[index].group?.id,
                    ),
                    child: Text(AppLocalizations.of(context)!
                        .requests_recall_text_button),
                  ),
                ),
              );
            },
            itemCount: listSendRequest.length,
          );
  }
}
