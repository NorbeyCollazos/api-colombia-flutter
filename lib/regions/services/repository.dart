import 'dart:convert';

import 'package:api_colombia/regions/models/region_response.dart';
import 'package:http/http.dart' as http;

class RegionsRepository {
  // Aquí irían los métodos para acceder a los datos de las regiones
  Future<List<RegionResponse>> fetchRegions() async {
    final response = await http.get(Uri.parse('https://api-colombia.com/api/v1/Region'));
    if (response.statusCode == 200) {
      var decodeJson = json.decode(response.body);
      return RegionResponse.fromJsonListRegions(decodeJson);
    } else {
      return Future.error(  'Failed to load regions data: ${response.statusCode}');
    }
  }
}
