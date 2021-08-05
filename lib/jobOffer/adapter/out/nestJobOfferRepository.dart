import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferMapper.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

class NestJobOfferRepository extends JobOfferRepository {
  final String apiUrl = "https://citrus-api-nest.herokuapp.com/api-nest/";

  @override
  Future<JobOffer> findJobOfferById(http.Client client, OfferId id) async {
    final response =
        await client.get(Uri.parse(apiUrl + 'job-offers/' + id.toString()));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offer');
    }

    var jobOffer = jsonDecode(response.body);

    return JobOfferMapper.mapToDomainEntityFromJson(jobOffer);
  }

  @override
  Future<List<JobOffer>> findAllJobOffers(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl + 'job-offers'));

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
      http.Client client, OfferId offerId, UserId userId) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'application/applied'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'employeeId': userId.getId,
        'offerId': offerId.getId,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create the application');
    }
    var jobOffer = jsonDecode(response.body);
    print(jobOffer);
    return true;
  }
}
