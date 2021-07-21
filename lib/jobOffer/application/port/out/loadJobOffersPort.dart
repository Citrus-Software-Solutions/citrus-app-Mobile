import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

abstract class LoadJobOffersPort {
  Future<List<JobOffer>> loadJobOffers();
  Future<JobOffer> loadJobOffer(OfferId offerId);
  Future<bool> hasUserApplied(OfferId offerId, UserId userId);
}
