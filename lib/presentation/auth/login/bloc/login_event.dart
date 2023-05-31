part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loggedInGoogle() = LoggedWithGoogle;

  const factory LoginEvent.loggedInEmail({
    required Email email,
    required Password password,
  }) = LoggedWithEmail;
}
