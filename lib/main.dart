import 'package:citrus_app_mobile/jobOffer/provider/jobOfferActions.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/widgets/theme.dart';
import 'package:provider/provider.dart';

import 'jobOffer/ui/screens/jobOfferListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => JobOfferActions(),
        child: MaterialApp(
          title: 'Citrus App Mobile',
          theme: new CitrusTheme().build(),
          home: JobOfferListScreen(title: "CitrusAPP"),
        ));
  }
}
