import 'package:citrus_app_mobile/employee/domain/values/employeeGender.dart';
import 'dart:math';

class EmployeeGenderMother {
  EmployeeGender create(String employeeGender) {
    return EmployeeGender(employeeGender);
  }

  EmployeeGender random() {
    List<String> genders = ["M", "F"];
    Random rand = Random();
    int genderIndex = rand.nextInt(genders.length);
    String gender = genders[genderIndex];

    return this.create(gender);
  }
}
