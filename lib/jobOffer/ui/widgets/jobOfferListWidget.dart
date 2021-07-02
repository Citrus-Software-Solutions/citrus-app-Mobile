import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferListItemWidget.dart';

class JobOfferListWidget extends StatelessWidget {
  final Future<List<JobOffer>> jobOfferList;

  const JobOfferListWidget({Key? key, required this.jobOfferList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<JobOffer>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              JobOffer jobOffer = snapshot.data![index];
              return JobOfferListItemWidget(jobOffer: jobOffer);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: jobOfferList,
    );
  }
}
