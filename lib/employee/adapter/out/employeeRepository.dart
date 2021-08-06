import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

abstract class EmployeeRepository {
  Future<Employee> findEmployeeById(UserId employeeId);
}
