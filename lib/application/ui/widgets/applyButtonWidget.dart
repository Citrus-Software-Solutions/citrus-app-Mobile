import 'package:citrus_app_mobile/application/adapter/out/applicationPersistenceAdapter.dart';
import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/mockApplicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/nestApplicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/springApplicationRepository.dart';
import 'package:citrus_app_mobile/application/application/port/out/createApplicationPort.dart';
import 'package:citrus_app_mobile/application/application/service/applyToJobOfferService.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/material.dart';

class ApplyButtonWidget extends StatefulWidget {
  ApplyButtonWidget({Key? key, required this.offerId}) : super(key: key);

  final OfferId offerId;

  @override
  _ApplyButtonWidget createState() => _ApplyButtonWidget(offerId);
}

class _ApplyButtonWidget extends State<ApplyButtonWidget> {
  late Application? _futureApplication;
  bool _hasApplied = false;
  OfferId offerId;

  _ApplyButtonWidget(this.offerId);

  @override
  void initState() {
    super.initState();
  }

  void _createApplication(OfferId offerId, UserId employeeId) async {
    ApplicationRepository applicationRepository =
        new MockApplicationRepository();
    CreateApplicationPort createApplicationPort =
        new ApplicationPersistenceAdapter(applicationRepository);
    ApplyToJobOfferService applyToJobOfferService =
        new ApplyToJobOfferService(createApplicationPort);

    showLoaderDialog(context);

    applyToJobOfferService.applyToJobOffer(offerId, employeeId).then((value) {
      setState(() {
        _futureApplication = value;
        if (_futureApplication is Application?) {
          _hasApplied = true;
          Navigator.pop(context);
        }
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
      barrierDismissible: _hasApplied,
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
                _createApplication(offerId, UserId(11));
              },
              child: const Text('Si'),
              key: Key('applyToJobOffer')),
        ],
      ),
    );
  }

  showError(BuildContext context) {
    Navigator.pop(context);
    setState(() {
      _hasApplied = true;
    });
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
    try {
      return TextButton(
        onPressed: () => _hasApplied ? null : showConfirmationDialog(context),
        child: _hasApplied
            ? Text('Aplicación en proceso', key: Key('applyButtonText'))
            : Text('Aplicar ahora', key: Key('applyButtonText')),
        key: const Key('apply'),
      );
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - applicationButtonWidget');
    }
  }
}
