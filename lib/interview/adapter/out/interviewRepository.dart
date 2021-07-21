import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:http/http.dart' as http;

abstract class InterviewRepository {
  Future<Interview> findInterviewById(http.Client client, InterviewId id);

  Future<List<Interview>> findAllInterviews(http.Client client);

  void cancelInterview(http.Client client, InterviewId offerId, UserId userId);
}
