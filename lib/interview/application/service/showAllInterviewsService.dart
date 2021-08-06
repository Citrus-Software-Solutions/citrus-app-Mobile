import 'package:citrus_app_mobile/interview/application/port/in/showAllInterviewsUseCase.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class ShowAllInterviewsService implements ShowAllInterviewsUseCase {
  LoadInterviewsPort _loadInterviewsPort;

  ShowAllInterviewsService(this._loadInterviewsPort);

  @override
  Future<List<Interview>> showAllInterviews(UserId userId) {
    return this._loadInterviewsPort.loadInterviews(userId);
  }
}
