import 'package:citrus_app_mobile/application/domain/values/applicationCompanyName.dart';
import 'package:citrus_app_mobile/application/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/offerId.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class Application {
  final ApplicationId id;
  final ApplicationDate dateApplication;
  final ApplicationStatus status;
  final ApplicationCompanyName companyName;
  final UserId employeeId;
  final OfferId jobOfferId;

  final Map<int, String> statusStrings = {
    0: "Pendiente por revisión",
    1: "Aceptado",
    2: "Rechazado"
  };

  Application(this.id, this.dateApplication, this.status, this.companyName,
      this.employeeId, this.jobOfferId);

  ApplicationId get getId => this.id;

  String get getIdToString => this.id.getApplicationIdToString();

  ApplicationStatus get getStatus => this.status;

  String? get getStatusToString => statusStrings[this.status];

  ApplicationCompanyName get getCompanyName => this.companyName;

  String get getCompanyNameToString => this.companyName.companyName.toString();
}
