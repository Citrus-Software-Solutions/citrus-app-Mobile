import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationButtonWidget extends StatelessWidget {
  final JobOffer jobOffer;

  const ApplicationButtonWidget({Key? key, required this.jobOffer})
      : super(key: key);

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
                      onPressed: () => Navigator.pop(context, 'Si'),
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
