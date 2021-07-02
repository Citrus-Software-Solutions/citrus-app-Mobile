import 'package:citrus_app_mobile/application/adapter/out/applicationPersistenceAdapter.dart';
import 'package:citrus_app_mobile/application/adapter/out/applicationRepository.dart';
import 'package:citrus_app_mobile/application/adapter/out/mockApplicationRepository.dart';
import 'package:citrus_app_mobile/application/application/port/out/createApplicationPort.dart';
import 'package:citrus_app_mobile/application/application/service/applyToJobOfferService.dart';
import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/values/userId.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationButtonWidget extends StatelessWidget {
  final JobOffer jobOffer;

  const ApplicationButtonWidget({Key? key, required this.jobOffer})
      : super(key: key);

  Future<Application?> _createApplication(
      OfferId offerId, UserId employeeId) async {
    ApplicationRepository applicationRepository =
        new MockApplicationRepository();
    CreateApplicationPort createApplicationPort =
        new ApplicationPersistenceAdapter(applicationRepository);
    ApplyToJobOfferService applyToJobOfferService =
        new ApplyToJobOfferService(createApplicationPort);

    return await applyToJobOfferService.applyToJobOffer(offerId, employeeId);
  }

  @override
  Widget build(BuildContext context) {
    try {
      return TextButton(
          onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Alerta'),
                  content: const Text(
                      '¿Está seguro que desea aplicar a esta oferta de trabajo?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'No'),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Si');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondDialog(
                                    futureApplication: _createApplication(
                                        jobOffer.getId, UserId(1)))));
                      },
                      child: const Text('Si'),
                    ),
                  ],
                ),
              ),
          child: Text('Aplicar ahora'));
    } catch (exception) {
      // TODO: Implementar manejo de errores
      throw Exception('Ocurrió un error - applicationButtonWidget');
    }
  }
}

class SecondDialog extends StatelessWidget {
  final Future<Application?> futureApplication;

  const SecondDialog({Key? key, required this.futureApplication})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Application?>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Success!!');
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: futureApplication,
    );
  }
}
