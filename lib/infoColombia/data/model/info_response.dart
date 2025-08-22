class InfoResponse {
  final String name;
  final String description;
  final String flags;

  InfoResponse({
    required this.name,
    required this.description,
    required this.flags,
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) {
    return InfoResponse(
      name: json['name'] as String,
      description: json['description'] as String,
      flags: json['flags'][1] as String,
    );
  }
}