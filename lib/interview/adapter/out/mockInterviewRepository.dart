import 'package:citrus_app_mobile/interview/adapter/out/interviewMapper.dart';
import 'package:citrus_app_mobile/interview/adapter/out/interviewRepository.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MockInterviewRepository extends InterviewRepository {
  final String apiUrl =
      "https://my-json-server.typicode.com/analetty/pruebatipfy/";

  @override
  void cancelInterview(http.Client client, InterviewId offerId, UserId userId) {
    // TODO: implement cancelInterview
  }

  @override
  Future<List<Interview>> findAllInterviews(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl + 'interviews/'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the interviews');
    }
    List<Interview> allInterviews = [];
    for (var jobOffer in jsonDecode(response.body)) {
      allInterviews.add(InterviewMapper.mapToDomainEntityFromJson(jobOffer));
    }

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
