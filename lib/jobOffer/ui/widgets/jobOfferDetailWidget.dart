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
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text("O" + jobOffer.id.offerId.toString()),
                )),
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
