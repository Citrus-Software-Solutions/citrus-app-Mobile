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
            title: Text(
              jobOffer.name.name.toString().toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  jobOffer.description.description.toString(),
                )),
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("O" + jobOffer.id.offerId.toString()),
            )),
      );
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - jobOfferListItem');
    }
  }
}
