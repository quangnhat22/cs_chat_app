part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.failure({required String message}) = LoginFailure;
}
