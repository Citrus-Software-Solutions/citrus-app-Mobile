import 'package:citrus_app_mobile/employer/domain/employer.dart';
import 'package:citrus_app_mobile/employer/domain/values/employerName.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';
import 'package:citrus_app_mobile/user/values/userAuth.dart';
import 'package:citrus_app_mobile/user/values/userId.dart';
import 'package:citrus_app_mobile/user/values/userLocation.dart';

class JobOfferMapper {
  static JobOffer mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return JobOffer(
        new OfferId(json['id']),
        new Employer(
            new UserAuth('asdasd', 'asdasd', 'asdsadasd'),
            new UserId(1),
            new UserLocation(1, 'type', 'name'),
            new EmployerName('name')),
        new OfferName(json['name']),
        new OfferDescription(json['description']),
        new OfferGender(json['gender']),
        new OfferDateRange(
            new DateTime(2021, 10, 21), new DateTime(2021, 10, 21)),
        new OfferAgeRange(10, 20));
  }
}
