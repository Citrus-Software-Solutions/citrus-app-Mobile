import 'package:citrus_app_mobile/application/ui/widgets/applicationButtonWidget.dart';
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
              title: Text(
                jobOffer.getNameToString.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    jobOffer.getDescriptionToString,
                  )),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text("O" + jobOffer.getIdToString),
              ));

          //TODO: Crear Widget Title
          Text labelDescription = Text(
            "Descripción",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          );
          Text labelRequirements = Text(
            "Requisitos",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          );

          Text description = Text(jobOffer.getDescriptionToString);
          Text requirements = Text(jobOffer.getMinAge.toString() +
              " años - " +
              jobOffer.getMaxAge.toString() +
              " años");

          Column col = Column(children: [
            details,
            labelDescription,
            description,
            labelRequirements,
            requirements,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[ApplicationButtonWidget(jobOffer: jobOffer)],
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
