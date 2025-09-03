import 'package:api_colombia/departments/model/city_capital.dart';

class DepartmentResponse {
  final int id;
  final String name;
  final String description;
  final CityCapital cityCapital;

  DepartmentResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.cityCapital,
  });

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) {
    return DepartmentResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      cityCapital: CityCapital.fromJson(json['cityCapital']),
    );
  }

  static List<DepartmentResponse> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => DepartmentResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

}