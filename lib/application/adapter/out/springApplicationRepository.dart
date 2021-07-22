import 'package:citrus_app_mobile/application/adapter/out/applicationMapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

class SpringApplicationRepository extends ApplicationRepository {
  final String apiUrl = "http://127.0.0.1:3000/";

  @override
  Future<Application?> applyToJobOffer(
      OfferId offerId, UserId employeeId) async {
    final response = await http.post(
      Uri.parse(apiUrl + '/job-application'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'jobOfferId': offerId.getId,
        'employeeId': employeeId.getId,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create the application');
    }

    return null;
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

  // 🚩 Falta implementar findAllApplications()
  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}
