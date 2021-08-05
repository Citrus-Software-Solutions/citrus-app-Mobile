import 'package:citrus_app_mobile/application/domain/application.dart';

abstract class LoadApplicationsPort {
  Future<List<Application>> loadApplications();
}
