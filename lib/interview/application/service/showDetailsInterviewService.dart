import 'package:citrus_app_mobile/interview/application/port/in/showInterviewDetailsUseCase.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';

class ShowDetailsInterviewService implements ShowInterviewDetailsUseCase {
  LoadInterviewsPort _loadInterviewsPort;

  ShowDetailsInterviewService(this._loadInterviewsPort);

  @override
  Future<Interview> showInterview(InterviewId interviewId) {
    return this._loadInterviewsPort.loadInterview(interviewId);
  }
}
