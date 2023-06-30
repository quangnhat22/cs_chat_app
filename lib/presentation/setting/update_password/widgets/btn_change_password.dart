import 'package:chatapp/common/widgets/stateless/button/custom_elevated_button.dart';
import 'package:chatapp/presentation/setting/update_password/bloc/update_password_bloc.dart';
import 'package:chatapp/presentation/setting/update_password/cubit/update_password_form_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BtnChangePassword extends StatelessWidget {
  const BtnChangePassword({super.key});

  void _onPressUpdateBtn(
    BuildContext ctx,
    String? oldPassword,
    String? newPassword,
  ) {
    ctx.read<UpdatePasswordBloc>().add(UpdatePasswordSubmitted(
          oldPassword: oldPassword,
          newPassword: newPassword,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdatePasswordBloc, UpdatePasswordState>(
        builder: (context, UpdatePasswordState formState) {
      return BlocBuilder<UpdatePasswordFormDartCubit,
          UpdatePasswordFormDartState>(builder: (context, state) {
        return formState.maybeWhen(
          loading: () => const CircularProgressIndicator(),
          orElse: () => Padding(
            padding: const EdgeInsets.only(top: 48),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                buttonText: AppLocalizations.of(context)!.confirm,
                onPressed: () => _onPressUpdateBtn(
                  context,
                  state.oldPassword,
                  state.newPassword,
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        );
      });
    });
  }
}
