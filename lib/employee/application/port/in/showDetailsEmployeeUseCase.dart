import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

abstract class ShowDetailEmployeeUseCase {
  Future<Employee> showDetailEmployee(UserId employeeId);
}
