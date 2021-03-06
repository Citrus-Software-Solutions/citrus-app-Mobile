import 'package:citrus_app_mobile/employee/provider/employeeActions.dart';
import 'package:citrus_app_mobile/application/provider/applicationActions.dart';
import 'package:citrus_app_mobile/interview/provider/interviewActions.dart';

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
      ChangeNotifierProvider<EmployeeActions>(
          create: (context) => EmployeeActions()),
      ChangeNotifierProvider<ApplicationActions>(
          create: (context) => ApplicationActions()),
      ChangeNotifierProvider<InterviewActions>(
          create: (context) => InterviewActions())
    ], child: MyApp());
  }
}
