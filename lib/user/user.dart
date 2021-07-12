import 'package:citrus_app_mobile/user/domain/values/values.dart';

class User {
  final UserId _id;

  User(this._id);

  int get getUserId => this._id.getId;
}
