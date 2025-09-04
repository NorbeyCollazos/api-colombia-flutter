import 'package:api_colombia/touristicAtracttion/models/touristic_atracttion_response.dart';
import 'package:api_colombia/touristicAtracttion/views/map_screen.dart';
import 'package:flutter/material.dart';

class TouristicAtracttionDescription extends StatelessWidget {
  final TouristicAtracttionResponse touristicAtracttionResponse;

  const TouristicAtracttionDescription({
    super.key,
    required this.touristicAtracttionResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(touristicAtracttionResponse.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                touristicAtracttionResponse.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: touristicAtracttionResponse.images.length,
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: touristicAtracttionResponse.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          touristicAtracttionResponse.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey[200],
                            child: const Icon(Icons.broken_image, size: 50),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                touristicAtracttionResponse.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double lat = double.parse(touristicAtracttionResponse.latitude);
          double long = double.parse(touristicAtracttionResponse.longitude);
          String name = touristicAtracttionResponse.name;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(
                latitude: lat,
                longitude: long,
                name: name,
              ),
            ),
          );
        },
        child: const Icon(Icons.map),
        tooltip: 'Ver en mapa',
      ),
    );
  }
}
