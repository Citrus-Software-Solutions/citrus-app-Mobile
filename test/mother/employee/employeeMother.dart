import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:citrus_app_mobile/user/values/userId.dart';

import '../user/userIdMother.dart';
import 'employeeBirthDateMother.dart';
import 'employeeGenderMother.dart';
import 'employeeNameMother.dart';

class EmployeeMother {
  static Employee create(UserId userId, EmployeeName employeeName,
      EmployeeGender employeeGender, EmployeeBirthDate employeeBirthDate) {
    return Employee(userId, employeeName, employeeGender, employeeBirthDate);
  }

  static Employee withId(UserId id) {
    return create(id, EmployeeNameMother().random(),
        EmployeeGenderMother().random(), EmployeeBirthDateMother().adult());
  }

  static Employee adult() {
    return create(UserIdMother().random(), EmployeeNameMother().random(),
        EmployeeGenderMother().random(), EmployeeBirthDateMother().adult());
  }

  static Employee younger() {
    return create(UserIdMother().random(), EmployeeNameMother().random(),
        EmployeeGenderMother().random(), EmployeeBirthDateMother().younger());
  }

  static Employee random() {
    return create(UserIdMother().random(), EmployeeNameMother().random(),
        EmployeeGenderMother().random(), EmployeeBirthDateMother().random());
  }
}
