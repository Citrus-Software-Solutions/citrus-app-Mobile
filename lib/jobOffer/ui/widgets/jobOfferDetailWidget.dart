import 'package:citrus_app_mobile/application/ui/widgets/applyButtonWidget.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JobOfferDetailWidget extends StatelessWidget {
  final Future<JobOffer> futureJobOffer;

  const JobOfferDetailWidget({Key? key, required this.futureJobOffer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<JobOffer>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          JobOffer jobOffer = snapshot.data!;

          ListTile details = ListTile(
              title: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  jobOffer.getNameToString.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              subtitle: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Theme.of(context).colorScheme.secondaryVariant,
                      ),
                      Text(
                        jobOffer.getLocationToString,
                      )
                    ],
                  )),
              leading: CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Image.asset('util/img/citrus-logo.JPG'),
                  )));

          //TODO: Crear Widget Title
          Align labelDescription = Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Descripción",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );

          Align labelRequirements = Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Requisitos",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ));

          Align description = Align(
              alignment: Alignment.topLeft,
              child: Text(
                jobOffer.getDescriptionToString,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ));

          String textRequirements = jobOffer.getMinAge.toString() +
              " años - " +
              jobOffer.getMaxAge.toString() +
              " años";

          Align requirements = Align(
              alignment: Alignment.topLeft,
              child: Text(
                textRequirements,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ));

          Column col = Column(children: [
            details,
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 16.0),
              child: Column(children: [
                labelDescription,
                description,
                labelRequirements,
                requirements,
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[ApplyButtonWidget(offerId: jobOffer.getId)],
            )
          ]);

          return Card(
            child: col,
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: futureJobOffer,
    );
  }
}
