import 'package:citrus_app_mobile/interview/adapter/out/interviewRepository.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:http/http.dart' as http;

class InterviewPersistanceAdapter implements LoadInterviewsPort {
  InterviewRepository _interviewRepository;

  InterviewPersistanceAdapter(this._interviewRepository);

  @override
  Future<dynamic> cancelInterview(InterviewId offerId, UserId userId) {
    return _interviewRepository.cancelInterview(http.Client(), offerId, userId);
  }

  @override
  Future<Interview> loadInterview(InterviewId interviewId) {
    return this
        ._interviewRepository
        .findInterviewById(http.Client(), interviewId);
  }

  @override
  Future<List<Interview>> loadInterviews() {
    return this._interviewRepository.findAllInterviews(http.Client());
  }
}
