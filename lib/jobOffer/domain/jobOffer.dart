import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';
import 'package:citrus_app_mobile/employer/domain/employer.dart';

class JobOffer {
  final OfferId id;
  final Employer employer;
  final OfferName name;
  final OfferDescription description;
  final OfferGender gender;
  final OfferDateRange dateRange;
  final OfferAgeRange ageRange;

  JobOffer(this.id, this.employer, this.name, this.description, this.gender,
      this.dateRange, this.ageRange);
}