import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/widgets/theme.dart';

import 'jobOffer/ui/screens/jobOfferListScreen.dart';

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
      home: JobOfferListScreen(title: "CitrusAPP"),
    );
  }
}
