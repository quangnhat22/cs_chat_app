import 'package:chatapp/presentation/group/edit_group/cubit/edit_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditGroupName extends StatefulWidget {
  const EditGroupName({super.key, this.groupName});

  final String? groupName;

  @override
  State<EditGroupName> createState() => _EditGroupNameState();
}

class _EditGroupNameState extends State<EditGroupName> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      _controller = TextEditingController(text: widget.groupName);
      _controller.addListener(() {
        context.read<EditGroupCubit>().groupNameChanged(_controller.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            label: Text(AppLocalizations.of(context)!.group_name)),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
