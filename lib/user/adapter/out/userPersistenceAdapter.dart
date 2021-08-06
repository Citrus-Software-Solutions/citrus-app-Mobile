import 'package:citrus_app_mobile/user/adapter/out/userRepository.dart';
import 'package:citrus_app_mobile/user/application/port/out/loadUserPort.dart';
import 'package:citrus_app_mobile/user/user.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class UserPersistenceAdapter implements LoadUserPort {
  UserRepository _userRepository;

  UserPersistenceAdapter(this._userRepository);

  @override
  Future<User> loadJobOffer(UserId userId) {
    return _userRepository.findUserById(userId);
  }
}
