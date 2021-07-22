import 'package:citrus_app_mobile/interview/application/port/in/cancelInterviewUseCase.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class CancelInterviewService implements CancelInterviewUseCase {
  LoadInterviewsPort _loadInterviewsPort;

  CancelInterviewService(this._loadInterviewsPort);

  @override
  void cancelInterview(InterviewId interviewId, UserId userId) {
    return this._loadInterviewsPort.cancelInterview(interviewId, userId);
  }
}
