import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/provider/jobOfferActions.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferListItemWidget.dart';
import 'package:citrus_app_mobile/user/provider/userActions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  late UserActions _userActions;
  late JobOfferActions _jobOfferActions;

  void loadJobOffers(context) {
    _jobOfferActions = Provider.of<JobOfferActions>(context);
    _jobOfferActions.showAllOffers();
  }

  ListView _jobOfferList(snapshot) {
    return ListView.builder(
      // scrollDirection: Axis.horizontal,
      itemCount: snapshot.data?.length,
      itemBuilder: (context, index) {
        JobOffer jobOffer = snapshot.data![index];
        return JobOfferListItemWidget(jobOffer: jobOffer, index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    loadJobOffers(context);

    Widget previousJobs = Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Trabajos Previos".toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              height: 350.0,
              child: FutureBuilder<List<JobOffer>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ListView list = _jobOfferList(snapshot);

                    return Column(
                      children: [
                        Container(
                          height: 250.0,
                          child: list,
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                future: _jobOfferActions.jobOffers,
              ),
            ),
          ],
        ),
      ),
    );

    return ListView(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xfff29711),
                      Color(0xfff0A73D),
                    ],
                    begin: FractionalOffset(0.2, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp)),
            child: Container(
              width: double.infinity,
              height: 275.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/236x/7d/1a/3f/7d1a3f77eee9f34782c6f88e97a6c888--no-face-facebook-profile.jpg"),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Alice James",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
              ),
            )),
        previousJobs,
      ],
    );
  }
}
