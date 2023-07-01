import 'package:chatapp/common/widgets/stateless/form/password_text_field.dart';
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdatePasswordFormDartCubit,
        UpdatePasswordFormDartState>(
      builder: (context, state) {
        return CPasswordTextField(
          key: const Key('updatePassword_oldPasswordInput_textField'),
          controller: _controller,
          label: AppLocalizations.of(context)!.current_password,
          errorText: state.oldPassword.displayError != null
              ? state.oldPassword.error?.message
              : null,
        );
      },
    );
  }
}
