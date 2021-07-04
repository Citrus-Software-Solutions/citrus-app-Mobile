import 'package:citrus_app_mobile/employee/domain/exceptions/tooYoungToBeEmployeeException.dart';

class EmployeeBirthDate {
  final DateTime _birthDate;

  EmployeeBirthDate(this._birthDate) {
    _verifyAge();
  }

  DateTime get getBirthDate => this._birthDate;

  void _verifyAge() {
    int currentYear = DateTime.now().year;
    int birthDateYear = this.getBirthDate.year;
    int yearsDifference = currentYear - birthDateYear;

    if (yearsDifference < 18) {
      throw new TooYoungToBeEmployeeException('Too young to be employee');
    }
  }
}
