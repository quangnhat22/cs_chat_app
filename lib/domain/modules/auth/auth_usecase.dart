import 'package:chatapp/domain/modules/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

abstract class AuthUseCase {
  Future<void> loginWithGoogle();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void> logOut();

  Future<bool> updatePassword({String? password, String? oldPassword});

  Future<bool> checkIsLoggedIn();

  Stream<String?> checkAccessTokenStream();

  Stream<String?> checkRefreshTokenStream();

  Future<bool> forgotPassword({required String email});
}

@Injectable(as: AuthUseCase)
class AuthUseCaeImpl extends AuthUseCase {
  final AuthRepository repo;

  AuthUseCaeImpl({required this.repo});

  @override
  Future<void> loginWithGoogle() async {
    return await repo.loginWithGoogle();
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await repo.loginWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await repo.signUpWithEmailAndPassword(email, password);
  }

  @override
  Future<bool> updatePassword({String? password, String? oldPassword}) async {
    // return repo.updatePassword(password, oldPassword);
    return await repo.updatePassword(password, oldPassword);
  }

  @override
  Future<void> logOut() {
    return repo.logOut();
  }

  @override
  Future<bool> checkIsLoggedIn() {
    return repo.checkIsLoggedIn();
  }

  @override
  Stream<String?> checkAccessTokenStream() {
    return repo.checkAccessTokenStream();
  }

  @override
  Stream<String?> checkRefreshTokenStream() {
    return repo.checkRefreshTokenStream();
  }

  @override
  Future<bool> forgotPassword({required String email}) {
    return repo.forgotPassword(email);
  }
}
