import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferMapper.dart';
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
      throw Exception('Failed to load the job offer');
    }
    List<JobOffer> allJobOffers = [];
    for (var jobOffer in jsonDecode(response.body)) {
      allJobOffers.add(JobOfferMapper.mapToDomainEntityFromJson(jobOffer));
    }
    return allJobOffers;
  }
  // List<JobOffer> applyToJobOffer(OfferId offerId, EmployeeId employeeId);
}
