abstract class UserRepository {
  Future<void> updateSelf(
    String? name,
    String? avatar,
    String? gender,
    String? phone,
    DateTime? birthday,
  );

  Future<void> getSelf();
}
