import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/mocJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showAllJobOffersService.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/values/values.dart';
import 'package:flutter/material.dart';

import 'employer/domain/employer.dart';
import 'employer/domain/values/employerName.dart';
import 'jobOffer/domain/values/values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Future<List<JobOffer>> _futureListJobOffer;
  late JobOffer _jobOffer = new JobOffer(
      new OfferId(10),
      new Employer(new UserAuth('asdasd', 'asdasd', 'asdsadasd'), new UserId(1),
          new UserLocation(1, 'type', 'name'), new EmployerName('name')),
      new OfferName('nombre ofertaaaaa'),
      new OfferDescription('desc ofertaaaaa'),
      new OfferGender('MMMM'),
      new OfferDateRange(
          new DateTime(2021, 10, 21), new DateTime(2021, 10, 21)),
      new OfferAgeRange(10, 20));

  @override
  void initState() {
    super.initState();
    _fetchJobOffer();
    _fetchJobOffers();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _fetchJobOffers() async {
    JobOfferRepository jobOfferRepository = new MockJobOfferRepository();
    LoadJobOffersPort loadJobOffersPort =
        new JobOfferPersistenceAdapter(jobOfferRepository);
    ShowAllJobOfferService showAllJobOfferService =
        new ShowAllJobOfferService(loadJobOffersPort);

    setState(() {
      _futureListJobOffer = showAllJobOfferService.showAllOffers();
    });
  }

  void _fetchJobOffer() async {
    JobOfferRepository jobOfferRepository = new MockJobOfferRepository();
    JobOffer jobOffer =
        await jobOfferRepository.findJobOfferById(new OfferId(1));
    await jobOfferRepository.findAllJobOffers();
    jobOfferRepository.applyToJobOffer(new OfferId(1), new UserId(3));
    setState(() {
      _jobOffer = jobOffer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _jobOffer.name.name.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            FutureBuilder<List<JobOffer>>(
              future: _futureListJobOffer,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String titles = "";
                  for (var data in snapshot.data!) {
                    titles += ' | ' + data.name.name.toString();
                  }
                  return Text(titles);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchJobOffer,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
