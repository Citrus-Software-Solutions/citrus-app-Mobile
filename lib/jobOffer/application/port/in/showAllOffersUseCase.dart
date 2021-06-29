import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

abstract class ShowAllOffersUseCase {
  // no se si es void, creo que no. No?
  // no sé si vamos a usar el patron Command como buckpal
  Future<List<JobOffer>> showAllOffers();
}
