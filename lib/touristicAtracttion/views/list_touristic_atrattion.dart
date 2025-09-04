import 'package:api_colombia/touristicAtracttion/models/touristic_atracttion_response.dart';
import 'package:api_colombia/touristicAtracttion/viewmodels/touristic_atracttion_view_model.dart';
import 'package:api_colombia/touristicAtracttion/views/touristic_atracttion_description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTouristicAtracttion extends StatefulWidget {
  const ListTouristicAtracttion({super.key});

  @override
  State<ListTouristicAtracttion> createState() => _ListTouristicAtracttionState();
}

class _ListTouristicAtracttionState extends State<ListTouristicAtracttion> {

@override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<TouristicAtracttionViewModel>(context, listen: false).getAttractions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final viewMoel = Provider.of<TouristicAtracttionViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Atracciones Turísticas de Colombia')),
      body: viewMoel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewMoel.errorMessage != null
          ? Center(child: Text('Error: ${viewMoel.errorMessage}'))
          : viewMoel.attractions.isEmpty
          ? const Center(child: Text('No hay atracciones turísticas disponibles'))
          : touristicAtracttionList(viewMoel.attractions),
    );
  }

  ListView touristicAtracttionList(List<TouristicAtracttionResponse> attractions) {
    return ListView.builder(
            itemCount: attractions.length,
            itemBuilder: (context, index) {
              final attraction = attractions[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Hero(
                    tag: attraction.id,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(attraction.images.first),
                      backgroundColor: Colors.grey[200],
                      onBackgroundImageError: (exception, stackTrace) => Container(
                        color: const Color.fromARGB(255, 100, 98, 98),
                        child: const Icon(Icons.broken_image, size: 30),
                      ),
                    ),
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
}
