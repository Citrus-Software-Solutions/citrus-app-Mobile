import 'package:citrus_app_mobile/jobOffer/adapter/out/nestJobOfferRepository.dart';
import 'package:flutter/material.dart';

import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showAllJobOffersService.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferListWidget.dart';

class JobOfferListScreen extends StatefulWidget {
  JobOfferListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _JobOfferListScreen createState() => _JobOfferListScreen(title);
}

class _JobOfferListScreen extends State<JobOfferListScreen> {
  late Future<List<JobOffer>> _futureListJobOffer;
  String title;

  _JobOfferListScreen(this.title);
  @override
  void initState() {
    super.initState();
    _fetchJobOffers();
  }

  void _fetchJobOffers() async {
    JobOfferRepository jobOfferRepository = new NestJobOfferRepository();
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
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'util/img/citrus-logo.JPG',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'CitrusAPP',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ))
          ],
        ),
      ),
      body: new JobOfferListWidget(jobOfferList: _futureListJobOffer),
    );
  }
}
