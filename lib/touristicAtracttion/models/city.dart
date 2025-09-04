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