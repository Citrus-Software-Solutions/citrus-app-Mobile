import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobOfferListItemWidget extends StatelessWidget {
  final JobOffer jobOffer;

  const JobOfferListItemWidget({Key? key, required this.jobOffer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        child: ListTile(
            title: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  jobOffer.getNameToString.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w800),
                )),
            subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Compañía: ' + jobOffer.getEmployer.getNameToString),
                    SizedBox(height: 5),
                    Text('Ubicación: ' + jobOffer.getLocationToString),
                  ],
                )),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text("O" + jobOffer.getIdToString),
            )),
      );
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - jobOfferListItem');
    }
  }
}
