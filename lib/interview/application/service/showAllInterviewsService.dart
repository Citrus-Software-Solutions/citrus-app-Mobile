import 'package:citrus_app_mobile/interview/application/port/in/showAllInterviewsUseCase.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';

class ShowAllInterviewsService implements ShowAllInterviewsUseCase {
  LoadInterviewsPort _loadInterviewsPort;

  ShowAllInterviewsService(this._loadInterviewsPort);

  @override
  Future<List<Interview>> showAllInterviews() {
    return this._loadInterviewsPort.loadInterviews();
  }
}
