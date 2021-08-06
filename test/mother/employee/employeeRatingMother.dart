import 'package:citrus_app_mobile/employee/domain/values/employeeRating.dart';
import 'dart:math';

class EmployeeRatingMother {
  static const MIN_VALUE = 0.0;
  static const MAX_VALUE = 5.0;

  EmployeeRating create(double value) {
    return EmployeeRating(value);
  }

  EmployeeRating random() {
    return this.create(_randomNumberInRange(MIN_VALUE, MAX_VALUE));
  }

  EmployeeRating underLength() {
    return this.create(MIN_VALUE - 1);
  }

  EmployeeRating upperLength() {
    return this.create(MAX_VALUE + 1);
  }

  double _randomNumberInRange(double min, double max) {
    Random rand = new Random();
    double value = rand.nextDouble() * (max - min) + min;
    return value;
  }
}
