import 'package:chatapp/common/widgets/stateless/button/custom_elevated_button.dart';
import 'package:chatapp/presentation/setting/update_password/cubit/update_password_form_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class BtnChangePassword extends StatelessWidget {
  const BtnChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdatePasswordFormDartCubit,
        UpdatePasswordFormDartState>(
      builder: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.inProgress) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomElevatedButton(
            buttonText: AppLocalizations.of(context)!.confirm,
            backgroundColor: !state.isValid
                ? Colors.grey[400]
                : Theme.of(context).colorScheme.primary,
            onPressed: !state.isValid
                ? null
                : () async {
                    await context
                        .read<UpdatePasswordFormDartCubit>()
                        .updateNewPasswordSubmit();
                  },
          );
        }
      },
    );
  }
}
