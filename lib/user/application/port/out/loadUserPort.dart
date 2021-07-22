import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:citrus_app_mobile/user/user.dart';

abstract class LoadUserPort {
  Future<User> loadJobOffer(UserId userId);
}
