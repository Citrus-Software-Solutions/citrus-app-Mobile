import 'package:citrus_app_mobile/application/application/port/out/createApplicationPort.dart';
import 'package:citrus_app_mobile/application/application/port/in/applyToJobOfferUseCase.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class ApplyToJobOfferService implements ApplyToJobOfferUseCase {
  CreateApplicationPort _createApplicationPort;

  ApplyToJobOfferService(this._createApplicationPort);

  @override
  Future<Application?> applyToJobOffer(OfferId offerId, UserId employeeId) {
    return _createApplicationPort.createApplication(offerId, employeeId);
  }
}
