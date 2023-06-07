import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/core/utils/date_time_format.dart';
import 'package:chatapp/domain/entities/group_request_entity.dart';
import 'package:chatapp/presentation/group/groups_request/cubit/group_request_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListRequestGroupSend extends StatelessWidget {
  const ListRequestGroupSend({super.key, required this.listSendRequest});

  final List<GroupRequestEntity> listSendRequest;

  void _onTapRecallButton(BuildContext ctx, String? groupId, String? friendId) {
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
                  urlImage: listSendRequest[index].receiver?.imageUrl,
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
                      listSendRequest[index].receiver?.members as String?,
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
