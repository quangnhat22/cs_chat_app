part of 'update_password_form_dart_cubit.dart';

@freezed
class UpdatePasswordFormDartState with _$UpdatePasswordFormDartState {
  const factory UpdatePasswordFormDartState.initial({
    String? oldPassword,
    String? newPassword,
    String? confirmPassword,
  }) = _Initial;
}
