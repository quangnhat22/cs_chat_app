import 'package:chatapp/core/utils/formz/confirmed_password.dart';
import 'package:chatapp/core/utils/formz/password.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_password_form_dart_cubit.freezed.dart';
part 'update_password_form_dart_state.dart';

@Injectable()
class UpdatePasswordFormDartCubit extends Cubit<UpdatePasswordFormDartState> {
  UpdatePasswordFormDartCubit({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(const UpdatePasswordFormDartState.initial());

  final AuthUseCase _authUseCase;

  void oldPasswordChanged(String value) {
    final oldPassword = Password.dirty(value);

    emit(state.copyWith(
        oldPassword: oldPassword,
        isValid: Formz.validate([
          oldPassword,
          state.newPassword,
          state.confirmPassword,
        ])));
  }

  void newPasswordChanged(String value) {
    final newPassword = Password.dirty(value);

    final confirmedPassword = ConfirmedPassword.dirty(
      password: newPassword.value,
      value: state.confirmPassword.value,
    );

    emit(
      state.copyWith(
        newPassword: newPassword,
        confirmPassword: confirmedPassword,
        isValid: Formz.validate(
          [
            state.oldPassword,
            newPassword,
            confirmedPassword,
          ],
        ),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.newPassword.value,
      value: value,
    );

    emit(
      state.copyWith(
        confirmPassword: confirmedPassword,
        isValid: Formz.validate(
          [
            state.oldPassword,
            state.newPassword,
            confirmedPassword,
          ],
        ),
      ),
    );
  }

  Future<void> updateNewPasswordSubmit() async {
    if (!state.isValid) return;
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));

    try {
      final isUpdateSuccess = await _authUseCase.updatePassword(
        password: state.newPassword.value,
        oldPassword: state.oldPassword.value,
      );
      if (isUpdateSuccess) {
        SnackBarApp.showSnackBar(
            null, 'Update password success', TypesSnackBar.success);
        emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
      } else {
        SnackBarApp.showSnackBar(
            null, 'Update password fail', TypesSnackBar.error);
        emit(state.copyWith(statusSubmit: FormzSubmissionStatus.failure));
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, 'Update password error', TypesSnackBar.error);
      emit(state.copyWith(statusSubmit: FormzSubmissionStatus.failure));
    }
  }
}
