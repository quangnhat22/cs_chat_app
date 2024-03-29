import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid(
      "Password is not valid. Password must have at least 8 characters and at least 1 uppercase letter");

  const PasswordValidationError(this.message);

  final String message;
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
    // return value == null || value.length < 6
    //     ? PasswordValidationError.invalid
    //     : null;
  }
}
