import 'package:citrus_app_mobile/jobOffer/application/port/in/hasUserAppliedUseCase.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

class HasUserAppliedService implements HasUserAppliedUseCase {
  LoadJobOffersPort _loadJobOffersPort;

  HasUserAppliedService(this._loadJobOffersPort);

  @override
  Future<bool> hasApplied(OfferId offerId, UserId userId) {
    return _loadJobOffersPort.hasUserApplied(offerId, userId);
  }
}
