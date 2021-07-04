import 'package:citrus_app_mobile/employer/domain/employer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

import 'package:citrus_app_mobile/employer/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';
import 'package:citrus_app_mobile/user/values/values.dart';

class JobOfferMapper {
  static JobOffer mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return JobOffer(
        new OfferId(json['id']),
        new Employer(new UserId(json['employer']['id']),
            new EmployerName(json['employer']['name'])),
        new OfferName(json['name']),
        new OfferDescription(json['description']),
        new OfferStatus(json['status']),
        new OfferGender(json['gender']),
        new OfferSalary(double.parse(json['salary'].toString())),
        new OfferVacants(json['available_vacans']),
        new OfferDateRange(DateTime.parse(json['date_begin']),
            DateTime.parse(json['date_end'])),
        new OfferAgeRange(json['min_age'], json['max_age']),
        new OfferLocation(json['location']['id'], json['location']['name']));
  }
}
