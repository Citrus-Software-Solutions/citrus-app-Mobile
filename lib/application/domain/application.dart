import 'package:citrus_app_mobile/application/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/values/userId.dart';

class Application {
  final ApplicationId id;
  final ApplicationDate dateApplication;
  final UserId employeeId;
  final OfferId jobOfferId;

  Application(this.id, this.dateApplication, this.employeeId, this.jobOfferId);
}
