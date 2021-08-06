import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/application/ui/widgets/applicationListItemWidget.dart';

class ApplicationListWidget extends StatelessWidget {
  final Future<List<Application>> applicationList;
  // final Future<List<JobOffer>> jobOfferList;
  final int maxApplications = 3;

  const ApplicationListWidget({Key? key, required this.applicationList})
      : super(key: key);

  ListView _applicationList(snapshot) {
    return ListView.builder(
      // itemCount: snapshot.data?.length,
      itemCount: maxApplications,
      itemBuilder: (context, index) {
        Application application = snapshot.data![index];
        return ApplicationListItemWidget(
            application: application, index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Text greetings = Text("Hola, Alba".toUpperCase(),
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        key: const Key('greetings'));

    Text labelDescription = Text("Aplicaciones".toUpperCase(),
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        key: const Key('offerList'));

    return FutureBuilder<List<Application>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ListView list = _applicationList(snapshot);

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 12, 0, 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: greetings,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 12, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: labelDescription,
                  ),
                ),
              ),
              Expanded(child: list)
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: applicationList,
    );
  }
}
