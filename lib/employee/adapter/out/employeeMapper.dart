import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

class EmployeeMapper {
  static Employee mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return Employee(
        UserId(json['id']),
        EmployeeName(
            json['first_name'], json['middle_name'], json['last_name'], ""),
        EmployeeBirthDate(_getDateTimeFromString(json['birth_date'])),
        _getSkills(json['skills']),
        // [],
        EmployeeRating(json['rating']),
        _getExperiences(json['work_experiences'])
        // []
        );
  }

  static List<EmployeeSkill> _getSkills(List<dynamic> skills) {
    List<EmployeeSkill> skillList = [];

    skills.forEach((skill) {
      skillList.add(EmployeeSkill(skill['name']));
    });

    return skillList;
  }

  static List<EmployeeExperience> _getExperiences(List<dynamic> experiences) {
    List<EmployeeExperience> experienceList = [];

    experiences.forEach((experience) {
      experienceList.add(EmployeeExperience(
          experience['job_title'], experience['company_name']));
    });

    return experienceList;
  }

  static DateTime _getDateTimeFromString(String date) {
    List<String> dateSplit = date.split('-');
    int day = int.parse(dateSplit[2]);
    int month = int.parse(dateSplit[1]);
    int year = int.parse(dateSplit[0]);

    return DateTime(year, month, day);
  }
}
