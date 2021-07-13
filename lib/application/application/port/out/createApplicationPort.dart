import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

abstract class CreateApplicationPort {
  Future<Application?> createApplication(OfferId offerId, UserId employeeId);
}
