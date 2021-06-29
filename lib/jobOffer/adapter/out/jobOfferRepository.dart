import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferMapper.dart';
import 'package:citrus_app_mobile/user/values/values.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

abstract class JobOfferRepository {
  final String apiUrl =
      "https://my-json-server.typicode.com/analetty/pruebatipfy/";

  Future<JobOffer> findJobOfferById(OfferId id) async {
    final response =
        await http.get(Uri.parse(apiUrl + 'joboffer/' + id.offerId.toString()));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offer');
    }
    return JobOfferMapper.mapToDomainEntityFromJson(jsonDecode(response.body));
  }

  Future<List<JobOffer>> findAllJobOffers() async {
    final response = await http.get(Uri.parse(apiUrl + 'joboffer/'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offers');
    }
    List<JobOffer> allJobOffers = [];
    for (var jobOffer in jsonDecode(response.body)) {
      allJobOffers.add(JobOfferMapper.mapToDomainEntityFromJson(jobOffer));
    }
    return allJobOffers;
  }

  void applyToJobOffer(OfferId offerId, UserId employeeId) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'application'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'jobOfferId': offerId.getId(),
        'employeeId': employeeId.getId(),
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create the application');
    }
  }
}
