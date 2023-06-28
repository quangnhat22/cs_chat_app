part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.submitInProgress() =
      ChangePasswordInProgress;
  const factory ChangePasswordState.submitSuccess() = ChangePasswordSuccess;
  const factory ChangePasswordState.submitFailed({String? message}) =
      ChangePasswordFailed;
}
