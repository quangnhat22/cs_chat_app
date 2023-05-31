import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/formz/confirmed_password.dart';
import '../../../../core/utils/formz/email.dart';
import '../../../../core/utils/formz/password.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

@Injectable()
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required AuthUseCase authUC})
      : _authUC = authUC,
        super(const SignUpState.initial());

  final AuthUseCase _authUC;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          password,
          confirmedPassword,
        ]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));
    try {
      await _authUC.signUpWithEmailAndPassword(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          statusSubmit: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
