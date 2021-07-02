import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/jobOffer/ui/screens/jobOfferDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citrus App Mobile',
      theme: new CitrusTheme().build(),
      // home: JobOfferListScreen(title: 'Job Offer List'),
      home: JobOfferDetailScreen(
        title: 'Job Offer List',
        offerId: OfferId(1),
      ),
    );
  }
}
