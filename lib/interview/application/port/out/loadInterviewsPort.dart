import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

abstract class LoadInterviewsPort {
  Future<List<Interview>> loadInterviews();
  Future<Interview> loadInterview(InterviewId interviewId);
  Future<dynamic> cancelInterview(InterviewId offerId, UserId userId);
}
