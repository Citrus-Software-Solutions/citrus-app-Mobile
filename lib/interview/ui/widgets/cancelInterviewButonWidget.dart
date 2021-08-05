import 'package:citrus_app_mobile/application/adapter/out/applicationPersistenceAdapter.dart';
import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/mockApplicationRepository.dart';
import 'package:citrus_app_mobile/application/application/port/out/createApplicationPort.dart';
import 'package:citrus_app_mobile/application/application/service/applyToJobOfferService.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/interview/adapter/out/interviewPersistanceAdapter.dart';
import 'package:citrus_app_mobile/interview/adapter/out/interviewRepository.dart';
import 'package:citrus_app_mobile/interview/adapter/out/mockInterviewRepository.dart';
import 'package:citrus_app_mobile/interview/application/port/out/loadInterviewsPort.dart';
import 'package:citrus_app_mobile/interview/application/service/cancelInterviewService.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/material.dart';

class CancelInterviewButtonWidget extends StatefulWidget {
  CancelInterviewButtonWidget({Key? key, required this.interviewId})
      : super(key: key);

  final InterviewId interviewId;

  @override
  _CancelInterviewButtonWidget createState() =>
      _CancelInterviewButtonWidget(interviewId);
}

class _CancelInterviewButtonWidget extends State<CancelInterviewButtonWidget> {
  InterviewId interviewId;

  _CancelInterviewButtonWidget(this.interviewId);

  @override
  void initState() {
    super.initState();
  }

  void _cancelInterview(InterviewId interviewId, UserId employeeId) async {
    InterviewRepository interviewRepository = new MockInterviewRepository();
    LoadInterviewsPort loadInterviewsPort =
        new InterviewPersistanceAdapter(interviewRepository);
    CancelInterviewService cancelInterviewService =
        new CancelInterviewService(loadInterviewsPort);

    showLoaderDialog(context);

    cancelInterviewService
        .cancelInterview(interviewId, UserId(1))
        .then((value) {
      setState(() {
        Navigator.pop(context);
      });
    }).onError((error, stackTrace) => showError(context));
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Cargando...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showConfirmationDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
            '¿Está seguro que desea aplicar a esta oferta de trabajo?',
            key: const Key('applicationDialogContent')),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'No'),
            child: const Text('No'),
          ),
          TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Si');
                _cancelInterview(interviewId, UserId(11));
              },
              child: const Text('Si'),
              key: Key('applyToJobOffer')),
        ],
      ),
    );
  }

  showError(BuildContext context) {
    Navigator.pop(context);
    setState(() {});
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
          'Ha ocurrido un error, ya aplicó a esta oferta de trabajo',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Ok'),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showConfirmationDialog(context),
      child: Text('Cancelar'),
      style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          primary: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.primary,
          onSurface: Colors.grey,
          elevation: 5,
          side: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 5)),
    );
  }
}
