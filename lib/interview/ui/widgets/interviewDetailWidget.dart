import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
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
        Text('Link de acceso'),
        Text('Fecha'),
        Text('Hora'),
        Text('Estado'),
        Text('Duracion'),
        CancelInterviewButtonWidget(interviewId: InterviewId(1))
      ],
    );
  }
}
