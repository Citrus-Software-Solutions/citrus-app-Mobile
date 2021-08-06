import 'package:citrus_app_mobile/application/application/port/out/loadApplicationsPort.dart';
import 'package:citrus_app_mobile/application/application/port/in/showAllApplicationsUseCase.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';

class ShowAllApplicationService implements ShowAllApplicationsUseCase {
  LoadApplicationsPort _loadApplicationsPort;

  ShowAllApplicationService(this._loadApplicationsPort);

  @override
  Future<List<Application>> showAllApplications() {
    return _loadApplicationsPort.loadApplications();
  }
}
