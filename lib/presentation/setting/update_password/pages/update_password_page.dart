import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/setting/update_password/bloc/update_password_bloc.dart';
import 'package:chatapp/presentation/setting/update_password/cubit/update_password_form_dart_cubit.dart';
import 'package:chatapp/presentation/setting/update_password/widgets/update_password_form.dart';
import 'package:chatapp/presentation/setting/update_password/widgets/update_password_page_app_%20bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<UpdatePasswordFormDartCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<UpdatePasswordBloc>(),
        ),
      ],
      child: const UpdatePasswordView(),
    );
  }
}

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePasswordBloc, UpdatePasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () => SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.update_password_success,
              TypesSnackBar.success),
          failure: (_) => SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.update_password_fail,
              TypesSnackBar.error),
          warning: (warningMessage) => SnackBarApp.showSnackBar(
              context, warningMessage, TypesSnackBar.warning),
        );
      },
      child: Scaffold(
        appBar: UpdatePasswordPageAppBar(
          title: AppLocalizations.of(context)!.change_password,
        ),
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
