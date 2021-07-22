import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/application/adapter/out/applicationPersistenceAdapter.dart';
import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/mockApplicationRepository.dart';
import 'package:citrus_app_mobile/application/application/port/out/loadApplicationsPort.dart';
import 'package:citrus_app_mobile/application/application/service/showAllApplicationsService.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/application/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/cupertino.dart';

class ApplicationActions with ChangeNotifier {
  late Future<List<Application>> _futureListApplication;
  late ShowAllApplicationService _showAllApplicationService;

  ApplicationActions() {
    ApplicationRepository applicationRepository =
        new MockApplicationRepository();

    LoadApplicationsPort loadApplicationsPort =
        new ApplicationPersistenceAdapter(applicationRepository);

    _showAllApplicationService =
        new ShowAllApplicationService(loadApplicationsPort);
  }

  get applications {
    return this._futureListApplication;
  }

  set applications(futureListApplication) {
    _futureListApplication = futureListApplication;
    notifyListeners();
  }

  void showAllApplications() {
    var futureListApplication =
        _showAllApplicationService.showAllApplications();

    this.applications = futureListApplication;

    notifyListeners();
  }
}
