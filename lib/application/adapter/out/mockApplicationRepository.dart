import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:citrus_app_mobile/application/adapter/out/applicationMapper.dart';
import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/application/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

class MockApplicationRepository extends ApplicationRepository {
  final String apiUrl =
      "https://my-json-server.typicode.com/analetty/pruebatipfy/";

  @override
  Future<Application?> applyToJobOffer(
      OfferId offerId, UserId employeeId) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'application'),
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
    var json = jsonDecode(response.body);
    return Application(
      ApplicationId(json['id']),
      ApplicationDate(new DateTime(2021, 1, 1)),
      ApplicationStatus(0),
      ApplicationCompanyName('Alpha'),
      employeeId,
      offerId,
    );
  }

  @override
  Future<List<Application>> findAllApplications(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl + 'applications/'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the applications');
    }
    List<Application> allApplications = [];
    for (var application in jsonDecode(response.body)) {
      allApplications
          .add(ApplicationMapper.mapToDomainEntityFromJson(application));
    }

    return allApplications;
  }
}
