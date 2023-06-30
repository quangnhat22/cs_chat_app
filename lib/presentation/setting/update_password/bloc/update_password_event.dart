part of 'update_password_bloc.dart';

@freezed
class UpdatePasswordEvent with _$UpdatePasswordEvent {
  const factory UpdatePasswordEvent.updatePasswordSubmitted({
    String? oldPassword,
    String? newPassword,
    String? confirmPassword,
  }) = UpdatePasswordSubmitted;
}
