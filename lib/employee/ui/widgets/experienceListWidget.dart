import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:citrus_app_mobile/employee/ui/widgets/experienceListItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/ui/widgets/jobOfferListItemWidget.dart';

class ExperienceListWidget extends StatelessWidget {
  final Future<List<EmployeeExperience>> experiences;

  const ExperienceListWidget({Key? key, required this.experiences})
      : super(key: key);

  ListView _experienceList(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.length,
      itemBuilder: (context, index) {
        EmployeeExperience employeeExperience = snapshot.data![index];
        return ExperienceListItemWidget(
            employeeExperience: employeeExperience, index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Text labelDescription = Text("Trabajos previos".toUpperCase(),
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        key: const Key('experienceList'));

    return FutureBuilder<List<EmployeeExperience>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ListView list = _experienceList(snapshot);

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
      future: experiences,
    );
  }
}
