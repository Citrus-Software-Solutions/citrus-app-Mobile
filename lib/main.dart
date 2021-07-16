import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/widgets/theme.dart';

import 'jobOffer/ui/screens/jobOfferListScreen.dart';
import 'mainProvider.dart';

void main() {
  runApp(MyAppProvider());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citrus App Mobile',
      theme: new CitrusTheme().build(),
      home: JobOfferListScreen(title: "CitrusAPP"),
    );
  }
}
