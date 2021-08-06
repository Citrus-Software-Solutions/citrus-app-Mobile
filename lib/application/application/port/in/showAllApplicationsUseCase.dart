import 'package:citrus_app_mobile/application/domain/application.dart';

abstract class ShowAllApplicationsUseCase {
  Future<List<Application>> showAllApplications();
}
