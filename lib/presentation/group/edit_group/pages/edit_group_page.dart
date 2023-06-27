import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/group/edit_group/cubit/edit_group_cubit.dart';
import 'package:chatapp/presentation/group/edit_group/widgets/button_edit_group.dart';
import 'package:chatapp/presentation/group/edit_group/widgets/edit_group_image.dart';
import 'package:chatapp/presentation/group/edit_group/widgets/edit_group_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditGroupPage extends StatelessWidget {
  const EditGroupPage({
    super.key,
    required this.groupId,
    this.groupName,
    this.groupAvatar,
  });

  final String groupId;
  final String? groupName;
  final String? groupAvatar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<EditGroupCubit>()..started(groupId, groupName, groupAvatar),
      child: EditGroupView(groupName: groupName),
    );
  }
}

class EditGroupView extends StatelessWidget {
  const EditGroupView({super.key, this.groupName});

  final String? groupName;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditGroupCubit, EditGroupState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == EditGroupSubmitStatus.success) {
          NavigationUtil.pop(result: true);
          //TODO: show snack bar
          SnackBarApp.showSnackBar(
            context,
            "Update group success",
            TypesSnackBar.success,
          );
        }
        if (state.status == EditGroupSubmitStatus.fail) {
          NavigationUtil.pop(result: true);
          //TODO: show snack bar
          SnackBarApp.showSnackBar(
            context,
            "Update group fail",
            TypesSnackBar.error,
          );
        }
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
          actions: const [ButtonEditGroup()],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const EditGroupImage(),
              EditGroupName(
                groupName: groupName,
              )
            ],
          ),
        ),
      ),
    );
  }
}
