import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/formz/email.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

@Injectable()
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authUseCase)
      : super(const ForgotPasswordState.initial());

  final AuthUseCase _authUseCase;

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      ),
    );
  }

  Future<void> submitSendEmail() async {
    try {
      if (!state.isValid) return;
      emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));
      final isSendEmailSuccess =
          await _authUseCase.forgotPassword(email: state.email.value);
      if (isSendEmailSuccess) {
        emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
        return;
      } else {
        emit(state.copyWith(statusSubmit: FormzSubmissionStatus.failure));
      }
    } catch (_) {
      emit(state.copyWith(statusSubmit: FormzSubmissionStatus.failure));
    }
  }
}
