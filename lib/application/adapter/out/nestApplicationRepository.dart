import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

class NestApplicationRepository extends ApplicationRepository {
  final String apiUrl = "https://citrus-api-nest.herokuapp.com/api-nest/";

  @override
  Future<Application?> applyToJobOffer(
      OfferId offerId, UserId employeeId) async {
    print(new DateTime(2021).toString());
    final response = await http.post(
      Uri.parse(apiUrl + '/job-application'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'employeeId': employeeId.getId,
        'offerId': offerId.getId,
        'applicationDate': new DateTime(2021).toString()
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create the application');
    }

    return null;
  }

  // 🚩 Falta implementar findAllApplications()
  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}
