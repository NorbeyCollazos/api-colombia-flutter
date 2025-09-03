import 'dart:convert';

import 'package:api_colombia/departments/model/department_response.dart';
import 'package:http/http.dart' as http;

class DepartmentsRepository {

  Future<List<DepartmentResponse>> fetchDepartments() async {
    final response = await http.get(Uri.parse('https://api-colombia.com/api/v1/Department'));

    if (response.statusCode == 200) {
      var decodeJson = json.decode(response.body);
      return DepartmentResponse.fromJsonList(decodeJson);
    } else {
      return Future.error(  'Failed to load departments data: ${response.statusCode}');
    }
  }

}