import 'package:citrus_app_mobile/user/application/port/in/showUserDetailsUseCase.dart';
import 'package:citrus_app_mobile/user/application/port/out/loadUserPort.dart';
import 'package:citrus_app_mobile/user/user.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class ShowUserDetailsService implements ShowUserDetailsUseCase {
  LoadUserPort _loadUserPort;

  ShowUserDetailsService(this._loadUserPort);

  @override
  Future<User> showDetailJobOffer(UserId userId) {
    return _loadUserPort.loadJobOffer(userId);
  }
}
