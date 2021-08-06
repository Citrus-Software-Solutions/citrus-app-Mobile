import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';

class ApplicationListItemWidget extends StatelessWidget {
  final Application application;
  final int index;

  const ApplicationListItemWidget(
      {Key? key, required this.application, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        child: ListTile(
          // onTap: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => JobOfferDetailScreen(
          //                 title: 'CitrusAPP',
          //                 offerId: application.getId,
          //               )));
          // },
          title: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                // application.getNameToString.toUpperCase(),
                'Aplicación ' + application.getIdToString,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.secondary),
                key: Key('aplicacion' + index.toString()),
              )),

          subtitle: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // SizedBox(height: 5),
                  Text('Compañía: ' + application.getCompanyNameToString),
                ],
              )),

          leading: CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: Image.asset('util/img/citrus-logo.JPG'),
              )),
          key: Key('offerCard' + index.toString()),
        ),
      );
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - applicationListItem');
    }
  }
}
