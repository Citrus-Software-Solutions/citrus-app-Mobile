import 'package:citrus_app_mobile/user/user.dart';

abstract class UserMapper {
  User mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return User(json['id']);
  }
}
