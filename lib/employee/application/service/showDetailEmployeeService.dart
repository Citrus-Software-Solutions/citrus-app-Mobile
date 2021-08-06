import 'package:citrus_app_mobile/employee/application/port/in/showDetailsEmployeeUseCase.dart';
import 'package:citrus_app_mobile/employee/application/port/out/loadEmployeePort.dart';
import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

class ShowDetailEmployeeService implements ShowDetailEmployeeUseCase {
  LoadEmployeePort _loadEmployeePort;

  ShowDetailEmployeeService(this._loadEmployeePort);

  @override
  Future<Employee> showDetailEmployee(UserId employeeId) {
    return _loadEmployeePort.loadEmployee(employeeId);
  }
}
