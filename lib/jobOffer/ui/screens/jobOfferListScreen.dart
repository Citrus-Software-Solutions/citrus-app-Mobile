import 'package:provider/provider.dart';
import 'package:citrus_app_mobile/jobOffer/provider/jobOfferActions.dart';
import 'package:flutter/material.dart';

import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferListWidget.dart';

class JobOfferListScreen extends StatefulWidget {
  JobOfferListScreen({Key? key}) : super(key: key);

  @override
  _JobOfferListScreen createState() => _JobOfferListScreen();
}

class _JobOfferListScreen extends State<JobOfferListScreen> {
  late Future<List<JobOffer>> _futureListJobOffer;

  _JobOfferListScreen();
  @override
  Widget build(BuildContext context) {
    final jobOfferActions = Provider.of<JobOfferActions>(context);

    jobOfferActions.showAllOffers();

    _futureListJobOffer = jobOfferActions.jobOffers;

    // TODO: Appbar generico, que acepte el titulo
    return JobOfferListWidget(jobOfferList: _futureListJobOffer);
  }
}
