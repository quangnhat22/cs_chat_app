import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_password_form_dart_state.dart';
part 'update_password_form_dart_cubit.freezed.dart';

@Injectable()
class UpdatePasswordFormDartCubit extends Cubit<UpdatePasswordFormDartState> {
  UpdatePasswordFormDartCubit({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(const UpdatePasswordFormDartState.initial());

  final AuthUseCase _authUseCase;

  void oldPasswordChanged(String value) {
    emit(state.copyWith(oldPassword: value));
  }

  void newPasswordChanged(String value) {
    emit(state.copyWith(newPassword: value));
  }

  void confirmPasswordChanged(String value) {
    emit(state.copyWith(confirmPassword: value));
  }
}
