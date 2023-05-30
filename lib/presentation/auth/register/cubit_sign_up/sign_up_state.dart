part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmedPassword,
    FormzSubmissionStatus? statusSubmit,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _Initial;
}
