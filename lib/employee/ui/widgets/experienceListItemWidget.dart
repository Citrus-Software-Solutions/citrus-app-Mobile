import 'package:citrus_app_mobile/employee/domain/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienceListItemWidget extends StatelessWidget {
  final EmployeeExperience employeeExperience;
  final int index;

  const ExperienceListItemWidget(
      {Key? key, required this.employeeExperience, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        child: ListTile(
          title: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                employeeExperience.getTitle.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.secondary),
                key: Key('experience' + index.toString()),
              )),
          subtitle: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Compañía: ' + employeeExperience.getCompany),
                ],
              )),
          leading: CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: Image.asset('util/img/citrus-logo.JPG'),
              )),
          key: Key('experienceCard' + index.toString()),
        ),
      );
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - experienceCardItem');
    }
  }
}
