import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:citrus_app_mobile/user/values/values.dart';
import 'package:citrus_app_mobile/user/user.dart';

class Employee extends User {
  final EmployeeName _name;
  final EmployeeGender _gender;
  final EmployeeBirthDate _birthDate;

  Employee(UserId id, this._name, this._gender, this._birthDate) : super(id);

  EmployeeName get getName => this._name;

  String get getFullName => this._name.getFullName;

  EmployeeGender get getGender => this._gender;

  String get getGenderToString => this._gender.getGender;

  EmployeeBirthDate get getBirthDate => this._birthDate;

  DateTime get getBirthDateDateTime => this._birthDate.getBirthDate;
}
