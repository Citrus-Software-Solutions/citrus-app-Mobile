import 'package:citrus_app_mobile/employee/domain/values/employeeExperience.dart';
import 'dart:math';
import 'package:faker/faker.dart';

class EmployeeExperiencesMother {
  late Faker faker;

  EmployeeExperiencesMother() {
    faker = Faker();
  }

  List<EmployeeExperience> create(List<EmployeeExperience> experiences) {
    return experiences;
  }

  List<EmployeeExperience> random() {
    Random rand = new Random();
    int experiencesCount = rand.nextInt(10);

    return this.create(this._experienceList(experiencesCount));
  }

  List<EmployeeExperience> _experienceList(int length) {
    List<EmployeeExperience> experiences = [];

    for (var i = 0; i < length; i++) {
      experiences
          .add(EmployeeExperience(faker.job.title(), faker.company.name()));
    }

    return experiences;
  }
}
