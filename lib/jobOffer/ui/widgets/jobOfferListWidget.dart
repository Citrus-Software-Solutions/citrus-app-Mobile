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
          Text labelDescription = Text(
            "Ofertas de trabajo".toUpperCase(),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          );
          ListView list = ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              JobOffer jobOffer = snapshot.data![index];
              return JobOfferListItemWidget(jobOffer: jobOffer);
            },
          );
          Column col = Column(
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
          return col;
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
