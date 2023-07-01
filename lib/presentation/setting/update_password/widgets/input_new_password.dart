import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/form/text_field.dart';
import '../cubit/update_password_form_dart_cubit.dart';

class InputNewPassword extends StatefulWidget {
  const InputNewPassword({super.key});

  @override
  State<InputNewPassword> createState() => _InputNewPasswordState();
}

class _InputNewPasswordState extends State<InputNewPassword> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context
          .read<UpdatePasswordFormDartCubit>()
          .newPasswordChanged(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      controller: _controller,
      icon: const Icon(Icons.vpn_key),
      label: AppLocalizations.of(context)!.new_password,
    );
  }
}
