import 'package:citrus_app_mobile/employee/adapter/out/employeePersistenceAdapter.dart';
import 'package:citrus_app_mobile/employee/adapter/out/employeeRepository.dart';
import 'package:citrus_app_mobile/employee/adapter/out/nestEmployeeRepository.dart';
import 'package:citrus_app_mobile/employee/application/port/out/loadEmployeePort.dart';
import 'package:citrus_app_mobile/employee/application/service/showDetailEmployeeService.dart';
import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:flutter/material.dart';

class EmployeeActions with ChangeNotifier {
  late Future<Employee> _currentEmployee;
  late ShowDetailEmployeeService _showDetailEmployeeService;

  EmployeeActions() {
    loadEmployee();
  }

  Future<Employee> get currentEmployee {
    return this._currentEmployee;
  }

  set currentEmployee(Future<Employee> user) {
    _currentEmployee = user;
    notifyListeners();
  }

  void loadEmployee() {
    EmployeeRepository userRepository = NestEmployeeRepository();

    LoadEmployeePort loadUserPort = EmployeePersistenceAdapter(userRepository);

    _showDetailEmployeeService = ShowDetailEmployeeService(loadUserPort);

    this._currentEmployee =
        _showDetailEmployeeService.showDetailEmployee(UserId(1));
  }
}
