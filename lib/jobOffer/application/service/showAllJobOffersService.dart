import 'package:citrus_app_mobile/jobOffer/application/port/in/showAllOffersUseCase.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

class ShowAllJobOfferService implements ShowAllOffersUseCase {
  LoadJobOffersPort _loadJobOffersPort;

  ShowAllJobOfferService(this._loadJobOffersPort);

  @override
  Future<List<JobOffer>> showAllOffers() {
    return _loadJobOffersPort.loadJobOffers();
  }
}
