import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

abstract class CancelInterviewUseCase {
  void cancelInterview(InterviewId interviewId, UserId userId);
}
