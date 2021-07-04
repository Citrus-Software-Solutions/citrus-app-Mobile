import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/employee/domain/exceptions/tooYoungToBeEmployeeException.dart';
import 'package:citrus_app_mobile/employee/domain/values/employeeBirthDate.dart';
import 'package:test/test.dart';

import '../mother/employee/employeeBirthDateMother.dart';
import '../mother/employee/employeeMother.dart';

void main() {
  group('JobOffer', () {
    test('The employee must be of legal age', () {
      expect(() => EmployeeMother.younger(),
          throwsA(const TypeMatcher<TooYoungToBeEmployeeException>()));
    });
  });
}
