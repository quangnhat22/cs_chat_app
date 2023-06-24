abstract class AuthRepository {
  Future<bool> checkIsLoggedIn();

  Future<void> loginWithGoogle();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<bool> updatePassword(String password, String oldPassword);

  Future<void> logOut();

  Stream<String?> checkAccessTokenStream();

  Stream<String?> checkRefreshTokenStream();

  Future<bool> forgotPassword(String email);
}
