import 'package:citrus_app_mobile/employee/domain/values/employeeName.dart';
import 'package:faker/faker.dart';

class EmployeeNameMother {
  late Faker faker;

  EmployeeNameMother() {
    faker = Faker();
  }

  EmployeeName create(String firstName, String secondName, String lastName,
      String secondLastName) {
    return EmployeeName(firstName, secondName, lastName, secondLastName);
  }

  EmployeeName random() {
    String firstName = faker.person.firstName();
    String secondName = faker.person.firstName();
    String lastName = faker.person.lastName();
    String secondLastName = faker.person.lastName();

    return this.create(firstName, secondName, lastName, secondLastName);
  }
}
