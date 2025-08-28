class RegionResponse {
  final int id;
  final String name;
  final String description;

  RegionResponse({
    required this.id,
    required this.name,
    required this.description,
  });

  factory RegionResponse.fromJson(Map<String, dynamic> json) {
    return RegionResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  static List<RegionResponse> fromJsonListRegions(List<dynamic> jsonList) {
    return jsonList
        .map((json) => RegionResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}