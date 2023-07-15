part of 'update_password_form_dart_cubit.dart';

@freezed
class UpdatePasswordFormDartState with _$UpdatePasswordFormDartState {
  const factory UpdatePasswordFormDartState.initial({
    @Default(Password.pure()) Password oldPassword,
    @Default(Password.pure()) Password newPassword,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmPassword,
    FormzSubmissionStatus? statusSubmit,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _Initial;
}
