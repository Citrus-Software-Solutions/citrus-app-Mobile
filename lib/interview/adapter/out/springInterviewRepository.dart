import 'package:citrus_app_mobile/interview/adapter/out/interviewMapper.dart';
import 'package:citrus_app_mobile/interview/adapter/out/interviewRepository.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpringInterviewRepository extends InterviewRepository {
  final String apiUrl = "http://prueba-ds.herokuapp.com/";

  @override
  Future<dynamic> cancelInterview(
      http.Client client, InterviewId offerId, UserId userId) async {
    print(offerId.toString());
    final response = await http.put(
      Uri.parse(apiUrl + 'interview/' + offerId.idToString + '/status/3'),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create the application');
    }

    var json = jsonDecode(response.body);
    return json;
  }

  @override
  Future<List<Interview>> findAllInterviews(
      http.Client client, UserId userId) async {
    final response = await client
        .get(Uri.parse(apiUrl + '/interview/employee/' + userId.getIdToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the interviews');
    }
    List<Interview> allInterviews = [];
    for (var jobOffer in jsonDecode(response.body)) {
      allInterviews.add(InterviewMapper.mapToDomainEntityFromJson(jobOffer));
    }
    print(allInterviews);
    return allInterviews;
  }

  @override
  Future<Interview> findInterviewById(
      http.Client client, InterviewId id) async {
    final response =
        await client.get(Uri.parse(apiUrl + 'interviews/' + id.idToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the interviews');
    }

    return InterviewMapper.mapToDomainEntityFromJson(jsonDecode(response.body));
  }
}
