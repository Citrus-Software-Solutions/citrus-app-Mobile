import 'package:citrus_app_mobile/employee/application/port/out/loadEmployeePort.dart';
import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

import 'employeeRepository.dart';

class EmployeePersistenceAdapter implements LoadEmployeePort {
  EmployeeRepository _employeeRepository;

  EmployeePersistenceAdapter(this._employeeRepository);

  @override
  Future<Employee> loadEmployee(UserId employeeId) {
    return _employeeRepository.findEmployeeById(employeeId);
  }
}
