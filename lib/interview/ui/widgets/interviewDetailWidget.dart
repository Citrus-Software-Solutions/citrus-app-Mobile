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
        Text('Entrevista'),
        Text('Oferta: ' + interview.title),
        Text('Link de acceso: ' + interview.accessURLToString),
        Text('Fecha: ' + interview.startDateAsDate.toString()),
        Text('Hora'),
        Text('Duracion: ' + interview.durationToString + ' minutos'),
        CancelInterviewButtonWidget(interviewId: interview.id)
      ],
    );
  }
}
