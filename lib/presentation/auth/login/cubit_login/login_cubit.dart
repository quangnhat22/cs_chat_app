import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/formz/email.dart';
import '../../../../core/utils/formz/password.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthUseCase authUC})
      : _authUC = authUC,
        super(const LoginState.initial());

  final AuthUseCase _authUC;

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> loginFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));
    try {
      await _authUC.loginWithEmailAndPassword(
        state.email.value,
        state.password.value,
      );
      // emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          statusSubmit: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));
      await _authUC.loginWithGoogle();
      // emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          statusSubmit: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
