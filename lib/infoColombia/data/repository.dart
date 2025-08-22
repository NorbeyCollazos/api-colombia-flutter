import 'dart:convert';

import 'package:api_colombia/infoColombia/data/model/info_response.dart';
import 'package:http/http.dart' as http;

class InfoRepository {

  Future<InfoResponse?> fetchInfo() async {
    final response = await http.get(Uri.parse('https://api-colombia.com/api/v1/Country/Colombia'));

    if (response.statusCode == 200) {
      var decodeJson = json.decode(response.body);
      InfoResponse infoResponse = InfoResponse.fromJson(decodeJson);
      return infoResponse;
    } else {
      return null;
    }
  }
}