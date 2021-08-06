import 'package:citrus_app_mobile/employee/adapter/out/employeeMapper.dart';
import 'package:citrus_app_mobile/employee/domain/employee.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'employeeRepository.dart';

class NestEmployeeRepository extends EmployeeRepository {
  final String apiUrl = "https://citrus-api-nest.herokuapp.com/api-nest/";

  @override
  Future<Employee> findEmployeeById(UserId employeeId) async {
    final response = await http
        .get(Uri.parse(apiUrl + 'employees/' + employeeId.getIdToString));

    if (response.statusCode != 200) {
      throw Exception('Failed to load the employee');
    }
    return EmployeeMapper.mapToDomainEntityFromJson(jsonDecode(response.body));
  }
}
