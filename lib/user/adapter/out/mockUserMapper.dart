import 'package:citrus_app_mobile/user/adapter/out/userMapper.dart';
import 'package:citrus_app_mobile/user/user.dart';

class MockUserMapper implements UserMapper {
  @override
  User mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return User(json['id']);
  }
}
