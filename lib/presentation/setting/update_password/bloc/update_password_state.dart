part of 'update_password_bloc.dart';

@freezed
class UpdatePasswordState with _$UpdatePasswordState {
  const factory UpdatePasswordState.initial() = _Initial;
  const factory UpdatePasswordState.loading() = UpdatePasswordLoading;
  const factory UpdatePasswordState.success() = UpdatePasswordSuccess;
  const factory UpdatePasswordState.warning({required String warningMessage}) =
      UpdatePasswordWarning;
  const factory UpdatePasswordState.failure({required String message}) =
      UpdatePasswordFailure;
}
