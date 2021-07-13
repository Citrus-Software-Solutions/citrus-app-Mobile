import 'package:citrus_app_mobile/employer/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

import 'package:citrus_app_mobile/user/user.dart';

class Employer extends User {
  final EmployerName _name;

  Employer(UserId id, this._name) : super(id);

  EmployerName get getName => this._name;

  String get getNameToString => this._name.getName;
}
