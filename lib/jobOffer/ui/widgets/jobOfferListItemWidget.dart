import 'package:citrus_app_mobile/jobOffer/ui/screens/jobOfferDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

class JobOfferListItemWidget extends StatelessWidget {
  final JobOffer jobOffer;
  final int index;

  const JobOfferListItemWidget(
      {Key? key, required this.jobOffer, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobOfferDetailScreen(
                          title: 'CitrusAPP',
                          offerId: jobOffer.getId,
                        )));
          },
          title: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                jobOffer.getNameToString.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.secondary),
                key: Key('oferta' + index.toString()),
              )),
          subtitle: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Compañía: ' + jobOffer.getEmployer.getNameToString),
                  SizedBox(height: 5),
                  Text('Ubicación: ' + jobOffer.getCityToString),
                ],
              )),
          leading: CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: Image.asset('util/img/citrus-logo.JPG'),
              )),
          key: Key('offerCard' + index.toString()),
        ),
      );
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - jobOfferListItem');
    }
  }
}
