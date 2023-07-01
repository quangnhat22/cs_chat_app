import 'package:chatapp/common/widgets/stateless/form/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          key: const Key('updatePassword_passwordInput_textField'),
          controller: _controller,
          label: AppLocalizations.of(context)!.new_password,
          errorText: state.newPassword.displayError != null
              ? state.newPassword.error?.message
              : null,
        );
      },
    );
  }
}
