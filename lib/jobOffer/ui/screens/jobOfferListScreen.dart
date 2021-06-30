import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/mocJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showAllJobOffersService.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferListWidget.dart';
import 'package:flutter/material.dart';

class JobOfferListScreen extends StatefulWidget {
  JobOfferListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _JobOfferListScreen createState() => _JobOfferListScreen();
}

class _JobOfferListScreen extends State<JobOfferListScreen> {
  late Future<List<JobOffer>> _futureListJobOffer;

  @override
  void initState() {
    super.initState();
    _fetchJobOffers();
  }

  void _fetchJobOffers() async {
    JobOfferRepository jobOfferRepository = new MockJobOfferRepository();
    LoadJobOffersPort loadJobOffersPort =
        new JobOfferPersistenceAdapter(jobOfferRepository);
    ShowAllJobOfferService showAllJobOfferService =
        new ShowAllJobOfferService(loadJobOffersPort);

    setState(() {
      _futureListJobOffer = showAllJobOfferService.showAllOffers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Appbar generico, que acepte el titulo
      appBar: AppBar(
        title: Text('Job Offer List'),
      ),
      body: new JobOfferListWidget(jobOfferList: _futureListJobOffer),
    );
  }
}
