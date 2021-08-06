import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

abstract class HasUserAppliedUseCase {
  Future<bool> hasApplied(OfferId offerId, UserId userId);
}
