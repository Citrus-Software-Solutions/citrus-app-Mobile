import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';

class JobOffer {
  final OfferId _id;
  final OfferName name;
  final OfferDescription description;
  final OfferGender gender;
  final OfferDateRange dateRange;
  final OfferAgeRange ageRange;

  JobOffer(this._id, this.name, this.description, this.gender, this.dateRange,
      this.ageRange);
}
