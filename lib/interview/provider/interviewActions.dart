import 'package:citrus_app_mobile/interview/adapter/out/interviewPersistanceAdapter.dart';
import 'package:citrus_app_mobile/interview/adapter/out/interviewRepository.dart';
import 'package:citrus_app_mobile/interview/adapter/out/springInterviewRepository.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/application/service/cancelInterviewService.dart';
import 'package:citrus_app_mobile/interview/application/service/showAllInterviewsService.dart';
import 'package:citrus_app_mobile/interview/application/service/showDetailsInterviewService.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/cupertino.dart';

class InterviewActions with ChangeNotifier {
  late Future<List<Interview>> _futureListInterviews;
  late Future<Interview> _futureInterview;
  late Future<dynamic> prueba;
  late ShowAllInterviewsService _showAllInterviewsService;
  late ShowDetailsInterviewService _showDetailsInterviewService;
  late CancelInterviewService _cancelInterviewService;

  InterviewActions() {
    InterviewRepository interviewRepository = new SpringInterviewRepository();

    LoadInterviewsPort loadInterviewsPort =
        new InterviewPersistanceAdapter(interviewRepository);

    _showAllInterviewsService =
        new ShowAllInterviewsService(loadInterviewsPort);
    _showDetailsInterviewService =
        new ShowDetailsInterviewService(loadInterviewsPort);
    _cancelInterviewService = new CancelInterviewService(loadInterviewsPort);
  }

  Future<List<Interview>> get interviews {
    return this._futureListInterviews;
  }

  set interviews(futureListInterviews) {
    _futureListInterviews = futureListInterviews;

    notifyListeners();
  }

  get interview {
    return this._futureInterview;
  }

  set interview(futureInterview) {
    _futureInterview = futureInterview;
    notifyListeners();
  }

  void showAllInterviews() {
    var futureListInterviews =
        _showAllInterviewsService.showAllInterviews(UserId(2));
    this.interviews = futureListInterviews;
    notifyListeners();
  }

  void getInterview(InterviewId interviewId) {
    var futureInterview =
        _showDetailsInterviewService.showInterview(interviewId);
    this.interview = futureInterview;
    notifyListeners();
  }

  Future<dynamic> cancelInterview(InterviewId interviewId, UserId userId) {
    var cancelInterview =
        _cancelInterviewService.cancelInterview(interviewId, userId);
    prueba = cancelInterview;
    notifyListeners();
    return cancelInterview;
  }
}
