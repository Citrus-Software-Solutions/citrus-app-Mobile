import 'package:citrus_app_mobile/employer/domain/employer.dart';
import 'package:citrus_app_mobile/employer/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    test('Employer name should be Maria', () {
      expect(
          Employer(UserId(1), EmployerName("Maria")).getNameToString, "Maria");
    });

    test('Employer name should be Maria', () {
      final employer = Employer(UserId(1), EmployerName("Maria"));

      employer.getNameToString;

      expect(employer.getNameToString, "Maria");
    });

    test('Employer id should be 1', () {
      final employer = Employer(UserId(1), EmployerName("Maria"));

      employer.getUserId;

      expect(employer.getUserId, 1);
    });
  });
}
