import 'package:citrus_app_mobile/application/domain/application.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';
import 'package:http/http.dart' as http;

abstract class ApplicationRepository {
  Future<Application?> applyToJobOffer(OfferId offerId, UserId employeeId);

  Future<List<Application>> findAllApplications(http.Client client);
}
