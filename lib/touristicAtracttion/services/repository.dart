import 'dart:convert';

import 'package:api_colombia/touristicAtracttion/models/touristic_atracttion_response.dart';
import 'package:http/http.dart' as http;

class TouristicAtracttionRepository {

  Future<List<TouristicAtracttionResponse>> getAll() async {
    final response = await http.get(Uri.parse('https://api-colombia.com/api/v1/TouristicAttraction'));
    if (response.statusCode == 200) {
      var decodeJson = json.decode(response.body);
      return TouristicAtracttionResponse.touristicAtracttionResponseFromJson(decodeJson);
    } else {
      return Future.error(  'Failed to load touristic attractions data: ${response.statusCode}');
    }
  }

}