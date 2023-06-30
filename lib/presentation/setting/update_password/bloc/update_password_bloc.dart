import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_event.dart';
part 'update_password_state.dart';
part 'update_password_bloc.freezed.dart';

class UpdatePasswordBloc
    extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  UpdatePasswordBloc({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(const _Initial()) {
    on<UpdatePasswordEvent>((event, emit) async {
      await event.map(
          updatePasswordSubmitted: (event) async =>
              _updatePasswordSubmitted(event, emit));
    });
  }

  final AuthUseCase _authUseCase;

  Future<void> _updatePasswordSubmitted(
      UpdatePasswordSubmitted event, Emitter<UpdatePasswordState> emit) async {
    if (event.newPassword == null) {
      return;
    }

    try {
      emit(const UpdatePasswordLoading());
      final isUpdateSuccess = await _authUseCase.updatePassword(
        password: event.newPassword,
        oldPassword: event.oldPassword,
      );
      if (isUpdateSuccess) {
        emit(const UpdatePasswordSuccess());
      } else {
        emit(const UpdatePasswordFailure(
            message: "Can't update password! Try again"));
      }
    } catch (e) {
      emit(UpdatePasswordFailure(message: e.toString()));
    }
  }
}
