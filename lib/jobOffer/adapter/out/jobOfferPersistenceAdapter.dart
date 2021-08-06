import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:http/http.dart' as http;

import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

class JobOfferPersistenceAdapter implements LoadJobOffersPort {
  JobOfferRepository _jobOfferRepository;

  JobOfferPersistenceAdapter(this._jobOfferRepository);

  @override
  Future<List<JobOffer>> loadJobOffers() {
    return _jobOfferRepository.findAllJobOffers(http.Client());
  }

  @override
  Future<JobOffer> loadJobOffer(OfferId offerId) {
    return _jobOfferRepository.findJobOfferById(http.Client(), offerId);
  }

  @override
  Future<bool> hasUserApplied(OfferId offerId, UserId userId) {
    return _jobOfferRepository.hasUserApplied(http.Client(), offerId, userId);
  }
}
