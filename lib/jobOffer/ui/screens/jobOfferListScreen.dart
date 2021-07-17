import 'package:provider/provider.dart';
import 'package:citrus_app_mobile/jobOffer/provider/jobOfferActions.dart';
import 'package:flutter/material.dart';

import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
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
  Widget build(BuildContext context) {
    final jobOfferActions = Provider.of<JobOfferActions>(context);

    jobOfferActions.showAllOffers();

    _futureListJobOffer = jobOfferActions.jobOffers;

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
