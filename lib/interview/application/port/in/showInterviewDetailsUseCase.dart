import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/values.dart';

abstract class ShowInterviewDetailsUseCase {
  Future<Interview> showInterview(InterviewId interviewId);
}
