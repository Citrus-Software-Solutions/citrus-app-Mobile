import 'package:http/http.dart' as http;
import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/application/port/out/createApplicationPort.dart';
import 'package:citrus_app_mobile/application/application/port/out/loadApplicationsPort.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class ApplicationPersistenceAdapter
    implements CreateApplicationPort, LoadApplicationsPort {
  ApplicationRepository _applicationRepository;

  ApplicationPersistenceAdapter(this._applicationRepository);

  @override
  Future<Application?> createApplication(OfferId offerId, UserId employeeId) {
    return _applicationRepository.applyToJobOffer(offerId, employeeId);
  }

  Future<List<Application>> loadApplications() {
    return _applicationRepository.findAllApplications(http.Client());
  }
}
