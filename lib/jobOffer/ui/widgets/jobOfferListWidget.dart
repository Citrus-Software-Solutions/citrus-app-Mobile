import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferListItemWidget.dart';

class JobOfferListWidget extends StatelessWidget {
  final Future<List<JobOffer>> jobOfferList;

  const JobOfferListWidget({Key? key, required this.jobOfferList})
      : super(key: key);

  ListView _jobOfferList(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.length,
      itemBuilder: (context, index) {
        JobOffer jobOffer = snapshot.data![index];
        return JobOfferListItemWidget(jobOffer: jobOffer, index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Text labelDescription = Text("Ofertas de trabajo".toUpperCase(),
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        key: const Key('offerList'));

    return FutureBuilder<List<JobOffer>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ListView list = _jobOfferList(snapshot);

          return Column(
            children: [
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
      future: jobOfferList,
    );
  }
}
