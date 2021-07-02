import 'package:citrus_app_mobile/jobOffer/adapter/out/mockJobOfferRepository.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'show_job_offer_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('showJobOffer', () {
    test('returns a JobOffer if the http call completes successfully',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse(
              'https://my-json-server.typicode.com/analetty/pruebatipfy/joboffer/2')))
          .thenAnswer((_) async => http.Response(
              '{ "id": 2, "name": "Oferta 2", "description": "Descripción Oferta Laboral 2", "status": "Published", "gender": null, "salary": 423.2, "available_Vacans": 1, "date_Begin": "2021-08-27T04:00:00.000+00:00", "date_End": "2021-08-28T04:00:00.000+00:00", "min_Age": null, "max_Age": null, "employer_Id": 3, "employer": { "id": 3, "name": "Linkbridge", "user_id": 3 }, "location": { "id": 24, "name": "Venezuela" }, "location_Id": 24 }',
              200));

      expect(
          await new MockJobOfferRepository()
              .findJobOfferById(client, OfferId(2)),
          isA<JobOffer>());
    });

/*     test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse(
              'https://jsonplaceholder.typicode.com/pruebatipfy/joboffer/2')))
          .thenAnswer((_) async => http.Response('{}', 404));

      expect(new MockJobOfferRepository().findJobOfferById(client, OfferId(2)),
          throwsException);
    }); */
  });
}
