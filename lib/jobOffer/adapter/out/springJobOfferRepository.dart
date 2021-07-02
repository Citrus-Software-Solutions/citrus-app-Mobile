import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferMapper.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

class SpringJobOfferRepository extends JobOfferRepository {
  final String apiUrl = "http://10.0.0.101:3000/";

  @override
  Future<JobOffer> findJobOfferById(http.Client client, OfferId id) async {
    final response =
        await client.get(Uri.parse(apiUrl + 'JobOffer/' + id.getIdToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offer');
    }

    return JobOfferMapper.mapToDomainEntityFromJson(jsonDecode(response.body));
  }

  @override
  Future<List<JobOffer>> findAllJobOffers(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl + 'JobOffer'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offers');
    }
    List<JobOffer> allJobOffers = [];
    for (var jobOffer in jsonDecode(response.body)) {
      final response = await http.get(
          Uri.parse(apiUrl + 'employer/' + jobOffer['employer_Id'].toString()));
      jobOffer['employer'] = jsonDecode(response.body);

      allJobOffers.add(JobOfferMapper.mapToDomainEntityFromJson(jobOffer));
    }

    return allJobOffers;
  }
}
