import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

abstract class ShowDetailJobOfferUseCase {
  Future<JobOffer> showDetailJobOffer(OfferId offerId);

  Future<bool> hasApplied(OfferId offerId, UserId userId);
}
