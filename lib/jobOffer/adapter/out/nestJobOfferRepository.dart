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
        await client.get(Uri.parse(apiUrl + 'job-offers/' + id.getIdToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offer');
    }

    var jobOffer = jsonDecode(response.body);
    Map<String, dynamic> json = {
      "id": jobOffer['id'],
      "name": jobOffer['name'],
      "description": jobOffer['description'],
      "status": jobOffer['status'],
      "gender": jobOffer['gender'],
      "salary": jobOffer['salary'],
      "available_vacans": jobOffer['availableVacans'],
      "date_begin": jobOffer['dateBegin'],
      "date_end": jobOffer['dateEnd'],
      "min_age": jobOffer['minAge'],
      "max_age": jobOffer['maxAge'],
      "employer_Id": jobOffer['creador']['id'],
      "employer": {
        "id": jobOffer['creador']['id'],
        "name": jobOffer['creador']['name'],
        "user_id": 3
      },
      "location": {"id": 24, "name": "Venezuela"},
      "location_Id": 24
    };

    return JobOfferMapper.mapToDomainEntityFromJson(json);
  }

  @override
  Future<List<JobOffer>> findAllJobOffers(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl + 'job-offers'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offers');
    }
    List<JobOffer> allJobOffers = [];
    for (var jobOffer in jsonDecode(response.body)) {
      if (jobOffer['status'] == 'Published') {
        Map<String, dynamic> json = {
          "id": jobOffer['id'],
          "name": jobOffer['name'],
          "description": jobOffer['description'],
          "status": jobOffer['status'],
          "gender": jobOffer['gender'],
          "salary": jobOffer['salary'],
          "available_vacans": jobOffer['availableVacans'],
          "date_begin": jobOffer['dateBegin'],
          "date_end": jobOffer['dateEnd'],
          "min_age": jobOffer['minAge'],
          "max_age": jobOffer['maxAge'],
          "employer_Id": jobOffer['creador']['id'],
          "employer": {
            "id": jobOffer['creador']['id'],
            "name": jobOffer['creador']['name'],
            "user_id": 3
          },
          "location": {"id": 24, "name": "Venezuela"},
          "location_Id": 24
        };
        allJobOffers.add(JobOfferMapper.mapToDomainEntityFromJson(json));
      }
    }

    return allJobOffers;
  }
}
