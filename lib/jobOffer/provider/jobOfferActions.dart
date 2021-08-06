import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/springApplicationRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/mockJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/nestJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/springJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/hasUserAppliedService.dart';
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
  late HasUserAppliedService _hasUserAppliedService;

  late Future<JobOffer> _futureJobOffer;
  late Future<bool> _hasApplied;

  JobOfferActions() {
    JobOfferRepository mockJobOfferRepository = new MockJobOfferRepository();
    JobOfferRepository nestJobOfferRepository = new NestJobOfferRepository();
    JobOfferRepository springJobOfferRepository =
        new SpringJobOfferRepository();

    LoadJobOffersPort loadJobOffersPort =
        new JobOfferPersistenceAdapter(nestJobOfferRepository);
    LoadJobOffersPort springLoadJobOffersPort =
        new JobOfferPersistenceAdapter(springJobOfferRepository);

    _showAllJobOfferService = new ShowAllJobOfferService(loadJobOffersPort);
    _showDetailJobOfferService =
        new ShowDetailJobOfferService(loadJobOffersPort);
    _hasUserAppliedService = new HasUserAppliedService(springLoadJobOffersPort);
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
    var _hasUserApplied = _hasUserAppliedService.hasApplied(offerId, userId);
    this._hasApplied = _hasUserApplied;
  }
}
