import 'package:citrus_app_mobile/interview/adapter/out/springInterviewRepository.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/interviewId.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'show_interviews.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('showInterview', () {
    test('returns a Interview if the http call completes successfully',
        () async {
      final client = MockClient();

      when(client.get(Uri.parse('http://prueba-ds.herokuapp.com/interview/2')))
          .thenAnswer((_) async => http.Response(
              '{"id":2,"employee":{"id":2,"first_name":"Luis","middle_name":"Alfonso","last_name":"Suarez","phone_number":"04124631165"},"staffMember":{"id":2,"first_name":"William","middle_name":"Arthur","last_name":"Wallace","title":"Jobs Interviewer"},"application":{"id":2,"application_Date":"2021-06-24T00:00:00.000+00:00","job_Offer":{"id":1,"title":"Clean PC labs","duration":3600,"employer":{"company_name":"Scholics University","id":0}}},"startDate":"2020-07-16T00:00:00.000+00:00","duration":28,"accessURL":"meet.com","status":3}',
              200));

      expect(
          await new SpringInterviewRepository()
              .findInterviewById(client, InterviewId(2)),
          isA<Interview>());
    });
    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('http://prueba-ds.herokuapp.com/interview/1000')))
          .thenAnswer((_) async => http.Response('Internal Server Error', 500));

      expect(
          new SpringInterviewRepository()
              .findInterviewById(client, InterviewId(1000)),
          throwsException);
    });
  });
}
