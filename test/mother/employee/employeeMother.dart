import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

import '../user/userIdMother.dart';
import 'employeeBirthDateMother.dart';
import 'employeeExperienceMother.dart';
import 'employeeNameMother.dart';
import 'employeeRatingMother.dart';
import 'employeeSkillsMother.dart';

class EmployeeMother {
  static Employee create(
      UserId userId,
      EmployeeName employeeName,
      EmployeeBirthDate employeeBirthDate,
      List<EmployeeSkill> employeeSkills,
      EmployeeRating employeeRating,
      List<EmployeeExperience> employeeExperiences) {
    return Employee(userId, employeeName, employeeBirthDate, employeeSkills,
        employeeRating, employeeExperiences);
  }

  static Employee withId(UserId id) {
    return create(
        id,
        EmployeeNameMother().random(),
        EmployeeBirthDateMother().adult(),
        EmployeeSkillsMother().random(),
        EmployeeRatingMother().random(),
        EmployeeExperiencesMother().random());
  }

  static Employee adult() {
    return create(
        UserIdMother().random(),
        EmployeeNameMother().random(),
        EmployeeBirthDateMother().adult(),
        EmployeeSkillsMother().random(),
        EmployeeRatingMother().random(),
        EmployeeExperiencesMother().random());
  }

  static Employee younger() {
    return create(
        UserIdMother().random(),
        EmployeeNameMother().random(),
        EmployeeBirthDateMother().younger(),
        EmployeeSkillsMother().random(),
        EmployeeRatingMother().random(),
        EmployeeExperiencesMother().random());
  }

  static Employee random() {
    return create(
        UserIdMother().random(),
        EmployeeNameMother().random(),
        EmployeeBirthDateMother().random(),
        EmployeeSkillsMother().random(),
        EmployeeRatingMother().random(),
        EmployeeExperiencesMother().random());
  }

  static Employee withRatingUnderMinValue() {
    return create(
        UserIdMother().random(),
        EmployeeNameMother().random(),
        EmployeeBirthDateMother().adult(),
        EmployeeSkillsMother().random(),
        EmployeeRatingMother().underLength(),
        EmployeeExperiencesMother().random());
  }

  static Employee withRatingUpperMaxValue() {
    return create(
        UserIdMother().random(),
        EmployeeNameMother().random(),
        EmployeeBirthDateMother().adult(),
        EmployeeSkillsMother().random(),
        EmployeeRatingMother().upperLength(),
        EmployeeExperiencesMother().random());
  }
}
