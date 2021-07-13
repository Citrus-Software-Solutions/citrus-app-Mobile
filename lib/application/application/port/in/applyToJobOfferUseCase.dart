import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

abstract class ApplyToJobOfferUseCase {
  Future<Application?> applyToJobOffer(OfferId offerId, UserId employeeId);
}
