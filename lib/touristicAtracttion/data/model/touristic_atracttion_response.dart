// To parse this JSON data, do
//
//     final touristicAtracttionResponse = touristicAtracttionResponseFromJson(jsonString);

import 'dart:convert';

List<TouristicAtracttionResponse> touristicAtracttionResponseFromJson(
  String str,
) => List<TouristicAtracttionResponse>.from(
  json.decode(str).map((x) => TouristicAtracttionResponse.fromJson(x)),
);

String touristicAtracttionResponseToJson(
  List<TouristicAtracttionResponse> data,
) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class TouristicAtracttionResponse {
  int id;
  String name;
  String description;
  List<String> images;
  String latitude;
  String longitude;
  int cityId;
  City city;

  TouristicAtracttionResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.latitude,
    required this.longitude,
    required this.cityId,
    required this.city,
  });

  factory TouristicAtracttionResponse.fromJson(Map<String, dynamic> json) =>
      TouristicAtracttionResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        latitude: json["latitude"],
        longitude: json["longitude"],
        cityId: json["cityId"],
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "latitude": latitude,
    "longitude": longitude,
    "cityId": cityId,
    "city": city.toJson(),
  };

  static List<TouristicAtracttionResponse> touristicAtracttionResponseFromJson(
    List<dynamic> jsonList,
  ) {
    return jsonList
        .map((json) =>
            TouristicAtracttionResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }

}

class City {
  int id;
  String name;
  String description;
  int? surface;
  int? population;
  String? postalCode;
  int departmentId;
  dynamic department;
  List<dynamic> touristAttractions;
  dynamic presidents;
  dynamic indigenousReservations;
  dynamic airports;
  dynamic radios;

  City({
    required this.id,
    required this.name,
    required this.description,
    required this.surface,
    required this.population,
    required this.postalCode,
    required this.departmentId,
    required this.department,
    required this.touristAttractions,
    required this.presidents,
    required this.indigenousReservations,
    required this.airports,
    required this.radios,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    surface: json["surface"],
    population: json["population"],
    postalCode: json["postalCode"],
    departmentId: json["departmentId"],
    department: json["department"],
    touristAttractions: List<dynamic>.from(
      json["touristAttractions"].map((x) => x),
    ),
    presidents: json["presidents"],
    indigenousReservations: json["indigenousReservations"],
    airports: json["airports"],
    radios: json["radios"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "surface": surface,
    "population": population,
    "postalCode": postalCode,
    "departmentId": departmentId,
    "department": department,
    "touristAttractions": List<dynamic>.from(touristAttractions.map((x) => x)),
    "presidents": presidents,
    "indigenousReservations": indigenousReservations,
    "airports": airports,
    "radios": radios,
  };
}
