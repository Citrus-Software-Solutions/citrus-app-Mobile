import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/application/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

class ApplicationMapper {
  static Application mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return Application(
        new ApplicationId(json['id']),
        new ApplicationDate(new DateTime(2020, 1, 1)),
        new UserId(json['employeeId']),
        new OfferId(json['jobOffer']));
  }
}
