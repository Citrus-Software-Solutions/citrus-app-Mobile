import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/nestJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showDetailJobOfferService.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferDetailWidget.dart';
import 'package:flutter/material.dart';

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
  OfferId offerId;
  String title;

  _JobOfferDetailScreen(this.title, this.offerId);

  @override
  void initState() {
    super.initState();
    _fetchJobOffer(offerId);
  }

  void _fetchJobOffer(OfferId offerId) async {
    JobOfferRepository jobOfferRepository = new NestJobOfferRepository();
    LoadJobOffersPort loadJobOfferPort =
        new JobOfferPersistenceAdapter(jobOfferRepository);
    ShowDetailJobOfferService showDetailJobOfferService =
        new ShowDetailJobOfferService(loadJobOfferPort);

    setState(() {
      _futureJobOffer = showDetailJobOfferService.showDetailJobOffer(offerId);
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
      body: JobOfferDetailWidget(futureJobOffer: _futureJobOffer),
    );
  }
}
