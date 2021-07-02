import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

abstract class ShowAllOffersUseCase {
  Future<List<JobOffer>> showAllOffers();
}
