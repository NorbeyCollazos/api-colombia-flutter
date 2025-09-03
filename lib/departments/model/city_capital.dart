class CityCapital {
  final String name;
  final String description;

  CityCapital({
    required this.name,
    required this.description,
  });

  factory CityCapital.fromJson(Map<String, dynamic> json) {
    return CityCapital(
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}