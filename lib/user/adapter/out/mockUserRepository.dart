import 'package:citrus_app_mobile/user/adapter/out/userRepository.dart';
import 'package:citrus_app_mobile/user/user.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class MockUserRepository extends UserRepository {
  @override
  Future<User> findUserById(UserId userId) {
    return Future.delayed(const Duration(seconds: 2), () => User(userId));
  }
}
