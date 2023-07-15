import 'package:chatapp/common/widgets/stateless/form/password_text_field.dart';
import 'package:chatapp/presentation/setting/update_password/cubit/update_password_form_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InputConfirmPassword extends StatefulWidget {
  const InputConfirmPassword({super.key});

  @override
  State<InputConfirmPassword> createState() => _InputConfirmPasswordState();
}

class _InputConfirmPasswordState extends State<InputConfirmPassword> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context
          .read<UpdatePasswordFormDartCubit>()
          .confirmPasswordChanged(_controller.text);
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
          key: const Key('updatePassword_confirmPasswordInput_textField'),
          controller: _controller,
          label: AppLocalizations.of(context)!.confirm_password,
          errorText: state.confirmPassword.displayError != null
              ? state.confirmPassword.error?.message
              : null,
        );
      },
    );
  }
}
