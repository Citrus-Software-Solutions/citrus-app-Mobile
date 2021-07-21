import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/mockJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showAllJobOffersService.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showDetailJobOfferService.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/cupertino.dart';

class JobOfferActions with ChangeNotifier {
  late Future<List<JobOffer>> _futureListJobOffer;
  late ShowAllJobOfferService _showAllJobOfferService;
  late ShowDetailJobOfferService _showDetailJobOfferService;
  late Future<JobOffer> _futureJobOffer;
  late Future<bool> _hasApplied;

  JobOfferActions() {
    JobOfferRepository jobOfferRepository = new MockJobOfferRepository();

    LoadJobOffersPort loadJobOffersPort =
        new JobOfferPersistenceAdapter(jobOfferRepository);

    _showAllJobOfferService = new ShowAllJobOfferService(loadJobOffersPort);
    _showDetailJobOfferService =
        new ShowDetailJobOfferService(loadJobOffersPort);
  }

  get jobOffers {
    return this._futureListJobOffer;
  }

  set jobOffers(futureListJobOffer) {
    _futureListJobOffer = futureListJobOffer;

    notifyListeners();
  }

  get jobOffer {
    return this._futureJobOffer;
  }

  set jobOffer(futureJobOffer) {
    _futureJobOffer = futureJobOffer;
    notifyListeners();
  }

  get hasApplied {
    return this._hasApplied;
  }

  void showAllOffers() {
    var futureListJobOffer = _showAllJobOfferService.showAllOffers();
    this.jobOffers = futureListJobOffer;
    notifyListeners();
  }

  void getJobOffer(OfferId offerId) {
    var futureJobOffer = _showDetailJobOfferService.showDetailJobOffer(offerId);
    this.jobOffer = futureJobOffer;
    notifyListeners();
  }

  void hasUserApplied(OfferId offerId, UserId userId) {
    var _hasUserApplied =
        _showDetailJobOfferService.hasApplied(offerId, userId);
    this._hasApplied = _hasUserApplied;
  }
}
