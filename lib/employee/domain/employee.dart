import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:citrus_app_mobile/user/values/values.dart';
import 'package:citrus_app_mobile/user/user.dart';

class Employee extends User {
  final EmployeeName name;
  final EmployeeGender gender;
  final EmployeeBirthDate birthDate;

  Employee(UserAuth auth, UserId id, UserLocation location, this.name,
      this.gender, this.birthDate)
      : super(auth, id, location);
}