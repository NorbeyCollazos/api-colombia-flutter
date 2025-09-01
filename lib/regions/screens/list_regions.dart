import 'package:api_colombia/regions/data/model/region_response.dart';
import 'package:api_colombia/regions/data/repository.dart';
import 'package:api_colombia/regions/screens/description_region.dart';
import 'package:flutter/material.dart';

class ListRegions extends StatelessWidget {
  const ListRegions({super.key});

  @override
  Widget build(BuildContext context) {
    final RegionsRepository repository = RegionsRepository();

    return Scaffold(
      appBar: AppBar(title: Text("Regiones")),
      body: FutureBuilder<List<RegionResponse>>(
        future: repository.fetchRegions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay regiones disponibles'));
          }

          final regions = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: regions.length,
              itemBuilder: (context, index) {
                final region = regions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: Hero(
                          tag: region.id,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              'assets/images/icono_regiones.jpg',
                            ),
                            backgroundColor: const Color.fromARGB(0, 238, 238, 238),
                          ),
                        ),
                        title: Text(region.name),
                        
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescriptionRegion(region: region),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
