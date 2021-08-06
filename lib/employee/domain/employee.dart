import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:citrus_app_mobile/user/user.dart';

class Employee extends User {
  final EmployeeName _name;
  final EmployeeBirthDate _birthDate;
  final List<EmployeeSkill> _skills;
  final EmployeeRating _rating;
  final List<EmployeeExperience> _experienceList;

  Employee(UserId id, this._name, this._birthDate, this._skills, this._rating,
      this._experienceList)
      : super(id);

  EmployeeName get getName => this._name;

  String get getFullName => this._name.getFullName;

  EmployeeBirthDate get getBirthDate => this._birthDate;

  DateTime get getBirthDateDateTime => this._birthDate.getBirthDate;

  List<EmployeeSkill> get getSkills => this._skills;

  EmployeeRating get getRating => this._rating;

  List<EmployeeExperience> get getWorkExperiences => this._experienceList;
}
