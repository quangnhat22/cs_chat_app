import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubit_create_group_form/create_group_cubit.dart';

class InputGroupName extends StatelessWidget {
  const InputGroupName({
    super.key,
  });

  void _inputChange(String value, BuildContext ctx) {
    ctx.read<CreateGroupCubit>().groupNameChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        onChanged: (value) => _inputChange(value, context),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            label: Text(AppLocalizations.of(context)!.group_name)),
      ),
    );
  }
}
