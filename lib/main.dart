import 'package:citrus_app_mobile/widgets/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/widgets/theme.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'mainProvider.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyAppProvider()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citrus App Mobile',
      theme: new CitrusTheme().build(),
      home: NavigationBar(),
    );
  }
}
