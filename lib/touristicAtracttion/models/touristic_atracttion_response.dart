import 'package:api_colombia/touristicAtracttion/models/city.dart';

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
        .map(
          (json) => TouristicAtracttionResponse.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
