import 'package:http/http.dart' as http;

import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:citrus_app_mobile/user/user.dart';

abstract class UserRepository {
  Future<User> findUserById(UserId userId);
}
