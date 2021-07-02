import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';

abstract class ShowDetailJobOfferUseCase {
  Future<JobOffer> showDetailJobOffer(OfferId offerId);
}
