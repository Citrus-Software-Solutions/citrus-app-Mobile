import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/application/provider/applicationActions.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:citrus_app_mobile/application/ui/widgets/applicationListWidget.dart';

class ApplicationListScreen extends StatefulWidget {
  ApplicationListScreen({Key? key}) : super(key: key);

  @override
  _ApplicationListScreen createState() => _ApplicationListScreen();
}

class _ApplicationListScreen extends State<ApplicationListScreen> {
  late Future<List<Application>> _futureListApplication;

  _ApplicationListScreen();

  @override
  Widget build(BuildContext context) {
    final ApplicationActions applicationActions =
        Provider.of<ApplicationActions>(context);

    applicationActions.showAllApplications();

    _futureListApplication = applicationActions.applications;

    return ApplicationListWidget(applicationList: _futureListApplication);
  }
}
