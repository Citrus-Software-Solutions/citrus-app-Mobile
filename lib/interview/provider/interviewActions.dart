import 'package:citrus_app_mobile/interview/adapter/out/interviewPersistanceAdapter.dart';
import 'package:citrus_app_mobile/interview/adapter/out/interviewRepository.dart';
import 'package:citrus_app_mobile/interview/adapter/out/mockInterviewRepository.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/application/service/showAllInterviewsService.dart';
import 'package:citrus_app_mobile/interview/application/service/showDetailsInterviewService.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:flutter/cupertino.dart';

class InterviewActions with ChangeNotifier {
  late Future<List<Interview>> _futureListInterviews;
  late Future<Interview> _futureInterview;
  late ShowAllInterviewsService _showAllInterviewsService;
  late ShowDetailsInterviewService _showDetailsInterviewService;

  InterviewActions() {
    InterviewRepository interviewRepository = new MockInterviewRepository();

    LoadInterviewsPort loadInterviewsPort =
        new InterviewPersistanceAdapter(interviewRepository);

    _showAllInterviewsService =
        new ShowAllInterviewsService(loadInterviewsPort);
    _showDetailsInterviewService =
        new ShowDetailsInterviewService(loadInterviewsPort);
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
    var futureListInterviews = _showAllInterviewsService.showAllInterviews();
    this.interviews = futureListInterviews;
    notifyListeners();
  }

  void getInterview(InterviewId interviewId) {
    var futureInterview =
        _showDetailsInterviewService.showInterview(interviewId);
    this.interview = futureInterview;
    notifyListeners();
  }
}
