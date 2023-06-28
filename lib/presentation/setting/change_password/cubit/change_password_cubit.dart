import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required AuthUseCase authUC})
      : _authUC = authUC,
        super(const ChangePasswordState.initial());

  final AuthUseCase _authUC;

  Future<void> updatePassword(
      {required String password, String? oldPassword}) async {
    try {
      emit(const ChangePasswordInProgress());
      final isSuccess =
          await _authUC.updatePassword(password, oldPassword ?? "");
      if (isSuccess) {
        emit(const ChangePasswordSuccess());
      } else {
        emit(const ChangePasswordFailed());
      }
    } catch (e) {
      emit(ChangePasswordFailed(message: e.toString()));
    }
  }
}
