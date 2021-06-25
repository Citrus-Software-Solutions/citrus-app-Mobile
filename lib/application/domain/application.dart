import 'package:citrus_app_mobile/application/domain/values/values.dart';
import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

class Application {
  final ApplicationId id;
  final ApplicationDate dateApplication;
  final Employee employee;
  final JobOffer jobOffer;

  Application(this.id, this.dateApplication, this.employee, this.jobOffer);
}
