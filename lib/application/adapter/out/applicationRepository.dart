import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/user/values/values.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

abstract class ApplicationRepository {
  final String apiUrl =
      "https://my-json-server.typicode.com/analetty/pruebatipfy/";

  Future<Application?> applyToJobOffer(
      OfferId offerId, UserId employeeId) async {
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

    return null;
  }
}
