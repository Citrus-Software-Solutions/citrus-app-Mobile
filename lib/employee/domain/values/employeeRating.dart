import 'package:citrus_app_mobile/employee/domain/exceptions/ratingUnderZero.dart';
import 'package:citrus_app_mobile/employee/domain/exceptions/ratingUpperFive.dart';

class EmployeeRating {
  final double _value;

  EmployeeRating(this._value) {
    this._verifyLimits();
  }

  double get getValue => this._value;

  void _verifyLimits() {
    if (this._value < 0.0) {
      throw new RatingUnderZero('The rating must be above zero');
    } else if (this._value > 5.0) {
      throw new RatingUpperFive('The rating should be under five');
    }
  }
}
