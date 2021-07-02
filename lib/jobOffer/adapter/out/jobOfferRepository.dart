import 'package:http/http.dart' as http;

import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

abstract class JobOfferRepository {
  Future<JobOffer> findJobOfferById(http.Client client, OfferId id);

  Future<List<JobOffer>> findAllJobOffers(http.Client client);
}
