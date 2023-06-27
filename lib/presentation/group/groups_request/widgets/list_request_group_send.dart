part of groups_request;

class ListRequestGroupSend extends StatelessWidget {
  const ListRequestGroupSend({super.key, required this.listSendRequest});

  final List<GroupRequestEntity> listSendRequest;

  void _onTapRecallButton(BuildContext ctx, String? friendId, String? groupId) {
    if (groupId == null) return;
    ctx.read<GroupRequestActionCubit>().recallRequest(groupId, friendId ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return listSendRequest.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text("You didn't send request!"),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listSendRequest[index].receiver?.name ?? ""),
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
