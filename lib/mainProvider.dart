import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'jobOffer/provider/jobOfferActions.dart';
import 'main.dart';

class MyAppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<JobOfferActions>(
          create: (context) => JobOfferActions()),
    ], child: MyApp());
  }
}
