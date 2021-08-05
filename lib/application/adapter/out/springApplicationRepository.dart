import 'package:citrus_app_mobile/application/adapter/out/applicationMapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

class SpringApplicationRepository extends ApplicationRepository {
  final String apiUrl = "http://prueba-ds.herokuapp.com/";

  @override
  Future<Application?> applyToJobOffer(
      OfferId offerId, UserId employeeId) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'job-application'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Conntection': 'keep-alive',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods':
            'GET, POST, PATCH, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
      },
      body: jsonEncode(<String, dynamic>{
        'status': 0,
        'date_application': new DateTime.now().toIso8601String(),
        'employee_id': employeeId.getId,
        'job_offer_id': offerId.getId
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create the application');
    }
    var json = jsonDecode(response.body);
    return Application(
        json['id'], json['application_Date'], employeeId, offerId);
  }

  Future<List<Application>?> getApplicationsByUser(UserId employeeId) async {
    final response = await http.get(Uri.parse(
        apiUrl + 'job-application/employee/' + employeeId.getIdToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offer');
    }
    List<Application> allApplications = [];
    for (var application in jsonDecode(response.body)) {
      Map<String, dynamic> json = {
        "id": application['id'],
        "date_application": application['date'],
        "employeeId": application['employee']['id'],
        "jobOfferId": application['joboffer']['id']
      };
      allApplications.add(ApplicationMapper.mapToDomainEntityFromJson(json));
    }
    return allApplications;
  }

  Future<bool> hasUserApplied(
      http.Client client, OfferId offerId, UserId userId) async {
    final response = await http.get(
        Uri.parse(apiUrl + 'job-application/employee/' + userId.getIdToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the job offers');
    }
    bool hasUserApplied = false;
    var jobApplication = jsonDecode(response.body);
    var allApplications = [];
    for (var application in jobApplication) {
      allApplications.add(application['jobOffer']['id']);
    }
    if (allApplications.contains(offerId.getId)) {
      hasUserApplied = true;
    }
    return hasUserApplied;
  }

  @override
  Future<List<Application>> findAllApplications(http.Client client) {
    // TODO: implement findAllApplications
    throw UnimplementedError();
  }
}
