import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/presentation/setting/update_password/cubit/update_password_form_dart_cubit.dart';
import 'package:chatapp/presentation/setting/update_password/widgets/update_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UpdatePasswordFormDartCubit>(),
      child: const UpdatePasswordView(),
    );
  }
}

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePasswordFormDartCubit,
        UpdatePasswordFormDartState>(
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.success) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar:
            MPageAppBar(title: AppLocalizations.of(context)!.change_password),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: UpdatePasswordForm(),
          ),
        ),
      ),
    );
  }
}
