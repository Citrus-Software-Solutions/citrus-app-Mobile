import 'package:citrus_app_mobile/employee/domain/exceptions/tooYoungToBeEmployeeException.dart';
import 'package:citrus_app_mobile/employee/domain/exceptions/ratingUnderZero.dart';
import 'package:citrus_app_mobile/employee/domain/exceptions/ratingUpperFive.dart';
import 'package:test/test.dart';

import '../mother/employee/employeeMother.dart';

void main() {
  group('Employee', () {
    test('The employee must be of legal age', () {
      expect(() => EmployeeMother.younger(),
          throwsA(const TypeMatcher<TooYoungToBeEmployeeException>()));
    });
    test('The rating must be above zero', () {
      expect(() => EmployeeMother.withRatingUnderMinValue(),
          throwsA(const TypeMatcher<RatingUnderZero>()));
    });
    test('The rating should be under five', () {
      expect(() => EmployeeMother.withRatingUpperMaxValue(),
          throwsA(const TypeMatcher<RatingUpperFive>()));
    });
  });
}
