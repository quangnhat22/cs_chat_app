import 'package:chatapp/core/utils/formz/email.dart';
import 'package:chatapp/core/utils/formz/password.dart';
import 'package:chatapp/domain/modules/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepo;

  LoginBloc({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(const _Initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
          loggedInGoogle: (event) async => await _loggedInGoogle(event, emit), loggedInEmail: (event) async => await _loggedEmail(event, emit));
    });
  }

  Future<void> _loggedInGoogle(
      LoggedWithGoogle event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginState.loading());
      await _authRepo.loginWithGoogle();
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.failure(message: e.toString()));
    }
  }

  Future<void> _loggedEmail(LoggedWithEmail event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginState.loading());
      await _authRepo.loginWithEmailAndPassword(event.email.value, event.password.value);
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.failure(message: e.toString()));
    }
  }
}
