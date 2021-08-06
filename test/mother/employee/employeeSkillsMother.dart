import 'package:citrus_app_mobile/employee/domain/values/employeeSkill.dart';
import 'dart:math';
import 'package:faker/faker.dart';

class EmployeeSkillsMother {
  late Faker faker;

  EmployeeSkillsMother() {
    faker = Faker();
  }

  List<EmployeeSkill> create(List<String> skills) {
    List<EmployeeSkill> skillList = [];

    skills.forEach((skill) {
      skillList.add(EmployeeSkill(skill));
    });

    return skillList;
  }

  List<EmployeeSkill> random() {
    Random rand = new Random();
    int skillsCount = rand.nextInt(10);

    return this.create(this._stringList(skillsCount));
  }

  List<EmployeeSkill> withLength(int length) {
    return this.create(this._stringList(length));
  }

  List<String> _stringList(int length) {
    List<String> skillList = [];

    for (var i = 0; i < length; i++) {
      skillList.add(faker.job.title());
    }

    return skillList;
  }
}
