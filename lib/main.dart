import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferPersistenceAdapter.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/jobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/adapter/out/mocJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/application/port/out/loadJobOffersPort.dart';
import 'package:citrus_app_mobile/jobOffer/application/service/showAllJobOffersService.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Citrus App Mobile'),
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
  late Future<List<JobOffer>> _futureListJobOffer;

  @override
  void initState() {
    super.initState();
    _fetchJobOffers();
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

  Widget jobOfferListWidget() {
    return FutureBuilder<List<JobOffer>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              JobOffer project = snapshot.data![index];
              return Card(
                child: ListTile(
                    title: Text(project.name.name.toString()),
                    subtitle: Text(project.description.description.toString()),
                    trailing: Icon(Icons.more_vert),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text("O" + project.id.offerId.toString()),
                    )),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
      future: _futureListJobOffer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job OfferList'),
      ),
      body: jobOfferListWidget(),
    );
  }
}
