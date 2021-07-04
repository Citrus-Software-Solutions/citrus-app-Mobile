import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/user/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

class NestApplicationRepository extends ApplicationRepository {
  final String apiUrl = "https://citrus-api-nest.herokuapp.com/api-nest/";

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
}
