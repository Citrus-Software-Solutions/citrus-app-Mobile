import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
import 'package:citrus_app_mobile/interview/provider/interviewActions.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final InterviewActions interviewActions =
        Provider.of<InterviewActions>(context, listen: false);

    showLoaderDialog(context);

    interviewActions.cancelInterview(interviewId, UserId(1)).then((value) {
      setState(() {
        print(value);
        Navigator.pop(context);
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
