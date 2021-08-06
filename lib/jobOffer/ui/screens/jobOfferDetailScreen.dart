import 'package:citrus_app_mobile/jobOffer/adapter/out/nestJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/provider/jobOfferActions.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferDetailWidget.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class JobOfferDetailScreen extends StatefulWidget {
  JobOfferDetailScreen({Key? key, required this.title, required this.offerId})
      : super(key: key);

  final String title;
  final OfferId offerId;

  @override
  _JobOfferDetailScreen createState() => _JobOfferDetailScreen(title, offerId);
}

class _JobOfferDetailScreen extends State<JobOfferDetailScreen> {
  late Future<JobOffer> _futureJobOffer;
  late Future<bool> _hasApplied;

  OfferId offerId;
  String title;

  _JobOfferDetailScreen(this.title, this.offerId);

  @override
  Widget build(BuildContext context) {
    final JobOfferActions jobOfferActions =
        Provider.of<JobOfferActions>(context);

    jobOfferActions.getJobOffer(offerId);
    jobOfferActions.hasUserApplied(offerId, UserId(1));
    _futureJobOffer = jobOfferActions.jobOffer;
    _hasApplied = jobOfferActions.hasApplied;

    return Scaffold(
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
      body: JobOfferDetailWidget(
          futureJobOffer: _futureJobOffer, hasApplied: _hasApplied),
    );
  }
}
