import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/mockJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showAllJobOffersService.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:flutter/cupertino.dart';

class JobOfferActions with ChangeNotifier {
  late Future<List<JobOffer>> _futureListJobOffer;
  late ShowAllJobOfferService _showAllJobOfferService;

  JobOfferActions() {
    JobOfferRepository jobOfferRepository = new MockJobOfferRepository();

    LoadJobOffersPort loadJobOffersPort =
        new JobOfferPersistenceAdapter(jobOfferRepository);

    _showAllJobOfferService = new ShowAllJobOfferService(loadJobOffersPort);
  }

  get jobOffers {
    return this._futureListJobOffer;
  }

  set jobOffers(futureListJobOffer) {
    _futureListJobOffer = futureListJobOffer;

    notifyListeners();
  }

  void showAllOffers() {
    var futureListJobOffer = _showAllJobOfferService.showAllOffers();
    this.jobOffers = futureListJobOffer;
    notifyListeners();
  }
}
