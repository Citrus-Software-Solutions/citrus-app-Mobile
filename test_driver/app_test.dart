import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Citrus App Mobile', () {
    final offerTextFinder = find.byValueKey('offerList');
    final offerTitleFinder = find.byValueKey('oferta0');
    final offerCardFinder = find.byValueKey('offerCard0');
    final offerDetailTitleFinder = find.byValueKey('offerDetailTitle');
    final applyButtonFinder = find.byValueKey('apply');
    final applyButtonTextFinder = find.byValueKey('applyButtonText');
    final applicationDialogContentFinder =
        find.byValueKey('applicationDialogContent');
    final applyToJobOfferButtonFinder = find.byValueKey('applyToJobOffer');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('Titulo de Aplicacion', () async {
      expect(await driver.getText(offerTextFinder), "OFERTAS DE TRABAJO");
    });

    test('Titulo de Oferta', () async {
      expect(
          await driver.getText(offerTitleFinder, timeout: Duration(minutes: 1)),
          "OFERTA 1");
    });

    test('Click a una oferta', () async {
      // TODO: Verificar la variable _hasApplied (?)
      await driver.tap(offerCardFinder);

      expect(
          await driver.getText(offerDetailTitleFinder,
              timeout: Duration(minutes: 1)),
          "OFERTA 1");
    });

    test('Boton de aplicar a oferta', () async {
      expect(await driver.getText(applyButtonTextFinder), "Aplicar ahora");
    });

    test('Click aplicar a oferta', () async {
      await driver.tap(applyButtonFinder);

      expect(
          await driver.getText(applicationDialogContentFinder,
              timeout: Duration(minutes: 1)),
          "¿Está seguro que desea aplicar a esta oferta de trabajo?");
    });

    test('Click si en dialog box de aplicar a oferta', () async {
      await driver.tap(applyToJobOfferButtonFinder);

      expect(
          await driver.getText(applyButtonTextFinder,
              timeout: Duration(minutes: 1)),
          "Aplicación en proceso");
    });
  });
}
