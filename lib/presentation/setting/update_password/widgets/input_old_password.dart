import 'package:chatapp/common/widgets/stateless/form/text_field.dart';
import 'package:chatapp/presentation/setting/update_password/cubit/update_password_form_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputOldPassword extends StatefulWidget {
  const InputOldPassword({super.key});

  @override
  State<InputOldPassword> createState() => _InputOldPasswordState();
}

class _InputOldPasswordState extends State<InputOldPassword> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context
          .read<UpdatePasswordFormDartCubit>()
          .oldPasswordChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      controller: _controller,
      icon: const Icon(Icons.lock),
      label: AppLocalizations.of(context)!.password,
    );
  }
}
