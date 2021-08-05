import 'package:citrus_app_mobile/application/adapter/out/applicationPersistenceAdapter.dart';
import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/mockApplicationRepository.dart';
import 'package:citrus_app_mobile/application/application/port/out/createApplicationPort.dart';
import 'package:citrus_app_mobile/application/application/service/applyToJobOfferService.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:flutter/material.dart';

class ApplyButtonWidget extends StatefulWidget {
  ApplyButtonWidget({Key? key, required this.offerId, required this.hasApplied})
      : super(key: key);

  final OfferId offerId;
  final Future<bool> hasApplied;

  @override
  _ApplyButtonWidget createState() => _ApplyButtonWidget(offerId, hasApplied);
}

class _ApplyButtonWidget extends State<ApplyButtonWidget> {
  late Application? _futureApplication;
  final Future<bool> hasApplied;

  bool _hasApplied = false;
  OfferId offerId;

  _ApplyButtonWidget(this.offerId, this.hasApplied);

  @override
  void initState() {
    super.initState();
  }

  void _createApplication(OfferId offerId, UserId employeeId) async {
    ApplicationRepository applicationRepository =
        new SpringJobOfferRepository();
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
      return FutureBuilder<bool>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              _hasApplied = _hasApplied || snapshot.data!;
              return TextButton(
                onPressed: () =>
                    _hasApplied ? null : showConfirmationDialog(context),
                child: _hasApplied
                    ? Text('Aplicación en proceso', key: Key('applyButtonText'))
                    : Text('Aplicar ahora', key: Key('applyButtonText')),
                key: const Key('apply'),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.white,
                    backgroundColor: _hasApplied
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                    onSurface: Colors.grey,
                    elevation: 5,
                    side: BorderSide(
                        color: _hasApplied
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                        width: 5)),
              );
            }
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: hasApplied,
      );
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - applicationButtonWidget');
    }
  }
}
