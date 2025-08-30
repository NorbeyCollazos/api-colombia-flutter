import 'package:api_colombia/touristicAtracttion/data/model/touristic_atracttion_response.dart';
import 'package:api_colombia/touristicAtracttion/data/repository.dart';
import 'package:api_colombia/touristicAtracttion/screens/touristic_atracttion_description.dart';
import 'package:flutter/material.dart';

class ListTouristicAtracttion extends StatelessWidget {
  const ListTouristicAtracttion({super.key});

  @override
  Widget build(BuildContext context) {
    final TouristicAtracttionRepository repository =
        TouristicAtracttionRepository();

    return Scaffold(
      appBar: AppBar(title: const Text('Atracciones Turísticas de Colombia')),
      body: FutureBuilder<List<TouristicAtracttionResponse>>(
        future: repository.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No se encontraron atracciones turísticas.'),
            );
          } else {
            final attractions = snapshot.data!;
            return ListView.builder(
              itemCount: attractions.length,
              itemBuilder: (context, index) {
                final attraction = attractions[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(attraction.images.first),
                      backgroundColor: Colors.grey[200],
                    ),
                    title: Text(attraction.name),
                    subtitle: Text(attraction.city.name),
                    onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TouristicAtracttionDescription(touristicAtracttionResponse: attraction),
                  ),
                ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
