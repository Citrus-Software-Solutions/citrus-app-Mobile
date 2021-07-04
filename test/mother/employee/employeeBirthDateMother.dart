import 'package:citrus_app_mobile/employee/domain/values/employeeBirthDate.dart';
import 'package:faker/faker.dart';

class EmployeeBirthDateMother {
  late Faker faker;
  late int currentYear;
  late int minYearYounger;
  late int maxYearYounger;
  late int minYearAdult;
  late int maxYearAdult;

  EmployeeBirthDateMother() {
    faker = Faker();
    currentYear = DateTime.now().year;
    minYearYounger = currentYear - 17;
    maxYearYounger = currentYear;
    minYearAdult = 1922;
    maxYearAdult = currentYear - 18;
  }

  EmployeeBirthDate create(DateTime employeeBirthDate) {
    return EmployeeBirthDate(employeeBirthDate);
  }

  EmployeeBirthDate random() {
    DateTime birthDate =
        faker.date.dateTime(minYear: minYearAdult, maxYear: currentYear);

    return this.create(birthDate);
  }

  EmployeeBirthDate adult() {
    Faker faker = Faker();
    DateTime birthDate =
        faker.date.dateTime(minYear: minYearAdult, maxYear: maxYearAdult);

    return this.create(birthDate);
  }

  EmployeeBirthDate younger() {
    Faker faker = Faker();
    DateTime birthDate =
        faker.date.dateTime(minYear: minYearYounger, maxYear: maxYearYounger);

    return this.create(birthDate);
  }
}
