import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/ui/widgets/cancelInterviewButonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterviewDetailWidget extends StatelessWidget {
  final Interview interview;

  InterviewDetailWidget(this.interview);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Entrevista',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 8.0),
        Text('Oferta: ' + interview.title),
        Text('Link de acceso: ' + interview.accessURLToString),
        Text('Fecha: ' + interview.startDate.dateAsString),
        Text('Hora ' + interview.startDate.timeAsString),
        Text('Duracion: ' + interview.durationToString + ' minutos'),
        const SizedBox(height: 8.0),
        CancelInterviewButtonWidget(interviewId: interview.id),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
