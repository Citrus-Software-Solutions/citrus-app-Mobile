import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferMapper.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

class SpringJobOfferRepository extends JobOfferRepository {
  final String apiUrl = "http://127.0.0.1:3000/";

  @override
  Future<JobOffer> findJobOfferById(http.Client client, OfferId id) async {
    final response =
        await client.get(Uri.parse(apiUrl + 'job-offer/' + id.getIdToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offer');
    }

    return JobOfferMapper.mapToDomainEntityFromJson(jsonDecode(response.body));
  }

  @override
  Future<List<JobOffer>> findAllJobOffers(http.Client client) async {
    final response =
        await client.get(Uri.parse(apiUrl + 'job-offer/status/Published'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offers');
    }
    List<JobOffer> allJobOffers = [];
    for (var jobOffer in jsonDecode(response.body)) {
      allJobOffers.add(JobOfferMapper.mapToDomainEntityFromJson(jobOffer));
    }

    return allJobOffers;
  }

  @override
  Future<bool> hasUserApplied(
      http.Client client, OfferId offerId, UserId userId) {
    // TODO: implement hasUserApplied
    throw UnimplementedError();
  }
}
