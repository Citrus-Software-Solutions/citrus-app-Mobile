import 'package:citrus_app_mobile/jobOffer/application/port/in/showDetailJobOfferUseCase.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

class ShowDetailJobOfferService implements ShowDetailJobOfferUseCase {
  LoadJobOffersPort _loadJobOffersPort;

  ShowDetailJobOfferService(this._loadJobOffersPort);

  @override
  Future<JobOffer> showDetailJobOffer(OfferId offerId) {
    return _loadJobOffersPort.loadJobOffer(offerId);
  }

  @override
  Future<bool> hasApplied(OfferId offerId, UserId userId) {
    return _loadJobOffersPort.hasUserApplied(offerId, userId);
  }
}
