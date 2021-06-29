import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

abstract class LoadJobOffersPort {
  Future<List<JobOffer>> loadJobOffers();
  Future<JobOffer> loadJobOffer(OfferId offerId);
}
