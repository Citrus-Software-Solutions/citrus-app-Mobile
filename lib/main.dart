import 'package:citrus_app_mobile/jobOffer/ui/screens/jobOfferListScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citrus App Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobOfferListScreen(title: 'Job Offer List'),
    );
  }
}
