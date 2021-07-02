import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

abstract class JobOfferRepository {
  Future<JobOffer> findJobOfferById(OfferId id);

  Future<List<JobOffer>> findAllJobOffers();
}
